package com.tuinstituto.fitness_tracker

import android.os.Bundle
import androidx.biometric.BiometricManager
import androidx.biometric.BiometricPrompt
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.Executor
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import kotlin.math.sqrt
import io.flutter.plugin.common.EventChannel
import android.content.Context
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager
import androidx.core.app.ActivityCompat
import android.content.Intent
import android.provider.Settings

class MainActivity: FlutterFragmentActivity() {

    private val BIOMETRIC_CHANNEL = "com.tuinstituto.fitness/biometric"
    private val ACCELEROMETER_CHANNEL = "com.tuinstituto.fitness/accelerometer"

    private lateinit var executor: Executor
    private lateinit var biometricPrompt: BiometricPrompt
    private var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        executor = ContextCompat.getMainExecutor(this)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            BIOMETRIC_CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {
                "checkBiometricSupport" -> {
                    val canAuth = checkBiometricSupport()
                    result.success(canAuth)
                }

                "authenticate" -> {
                    pendingResult = result
                    showBiometricPrompt()
                }

                else -> {
                    result.notImplemented()
                }
            }
        }

        setupAccelerometerChannel(flutterEngine)
        setupGpsChannel(flutterEngine)
    }

    private fun checkBiometricSupport(): Boolean {
        val biometricManager = BiometricManager.from(this)

        return when (biometricManager.canAuthenticate(
            BiometricManager.Authenticators.BIOMETRIC_STRONG
        )) {
            BiometricManager.BIOMETRIC_SUCCESS -> true
            else -> false
        }
    }

    private fun showBiometricPrompt() {
        val promptInfo = BiometricPrompt.PromptInfo.Builder()
            .setTitle("Autenticación Biométrica")
            .setSubtitle("Usa tu huella dactilar")
            .setDescription("Coloca tu dedo en el sensor")
            .setNegativeButtonText("Cancelar")
            .setAllowedAuthenticators(BiometricManager.Authenticators.BIOMETRIC_STRONG)
            .build()

        biometricPrompt = BiometricPrompt(this, executor,
            object : BiometricPrompt.AuthenticationCallback() {

                override fun onAuthenticationSucceeded(
                    result: BiometricPrompt.AuthenticationResult
                ) {
                    super.onAuthenticationSucceeded(result)
                    pendingResult?.success(true)
                    pendingResult = null
                }

                override fun onAuthenticationError(
                    errorCode: Int,
                    errString: CharSequence
                ) {
                    super.onAuthenticationError(errorCode, errString)
                    pendingResult?.success(false)
                    pendingResult = null
                }

                override fun onAuthenticationFailed() {
                    super.onAuthenticationFailed()
                }
            }
        )

        biometricPrompt.authenticate(promptInfo)
    }

    private fun setupAccelerometerChannel(flutterEngine: FlutterEngine) {
        val sensorManager = getSystemService(SENSOR_SERVICE) as SensorManager
        val accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)

        var stepCount = 0
        var lastMagnitude = 0.0
        var lastStepTime = 0L
        var sensorEventListener: SensorEventListener? = null

        val magnitudeHistory = mutableListOf<Double>()
        val magnitudeHistorySize = 10

        val deviationHistory = mutableListOf<Double>()
        val deviationHistorySize = 50
        var sampleCount = 0
        var currentStableActivityType = "stationary"
        
        var stationaryScore = 0
        var walkingScore = 0
        var runningScore = 0

        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            ACCELEROMETER_CHANNEL
        ).setStreamHandler(object : EventChannel.StreamHandler {

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                sensorEventListener = object : SensorEventListener {

                    override fun onSensorChanged(event: SensorEvent?) {
                        event?.let {
                            val x = it.values[0]
                            val y = it.values[1]
                            val z = it.values[2]

                            val magnitude = sqrt((x * x + y * y + z * z).toDouble())

                            // Detección de pasos con debounce (mínimo 250ms entre pasos)
                            if (magnitude > 12.0 && lastMagnitude <= 12.0) {
                                val now = System.currentTimeMillis()
                                if (now - lastStepTime > 250) {
                                    stepCount++
                                    lastStepTime = now
                                }
                            }

                            lastMagnitude = magnitude

                            // Historial de magnitud para compatibilidad (gráfico/UI)
                            magnitudeHistory.add(magnitude)
                            if (magnitudeHistory.size > magnitudeHistorySize) {
                                magnitudeHistory.removeAt(0)
                            }
                            val avgMagnitude = magnitudeHistory.average()

                            // Calcular desviación media respecto a la gravedad estándar
                            val deviation = Math.abs(magnitude - 9.80665)
                            deviationHistory.add(deviation)
                            if (deviationHistory.size > deviationHistorySize) {
                                deviationHistory.removeAt(0)
                            }
                            val avgDeviation = deviationHistory.average()

                            val newActivityType = when {
                                avgDeviation < 0.8 -> "stationary"
                                avgDeviation < 2.8 -> "walking"
                                else -> "running"
                            }

                            when (newActivityType) {
                                "stationary" -> {
                                    stationaryScore = (stationaryScore + 1).coerceAtMost(10)
                                    walkingScore = (walkingScore - 1).coerceAtLeast(0)
                                    runningScore = (runningScore - 1).coerceAtLeast(0)
                                }
                                "walking" -> {
                                    walkingScore = (walkingScore + 1).coerceAtMost(10)
                                    stationaryScore = (stationaryScore - 1).coerceAtLeast(0)
                                    runningScore = (runningScore - 1).coerceAtLeast(0)
                                }
                                "running" -> {
                                    runningScore = (runningScore + 1).coerceAtMost(10)
                                    stationaryScore = (stationaryScore - 1).coerceAtLeast(0)
                                    walkingScore = (walkingScore - 1).coerceAtLeast(0)
                                }
                            }

                            val threshold = 5
                            val targetStableType = when {
                                stationaryScore >= threshold -> "stationary"
                                walkingScore >= threshold -> "walking"
                                runningScore >= threshold -> "running"
                                else -> null
                            }

                            if (targetStableType != null && targetStableType != currentStableActivityType) {
                                currentStableActivityType = targetStableType
                            }

                            sampleCount++
                            if (sampleCount >= 3) {
                                sampleCount = 0

                                val data = mapOf(
                                    "stepCount" to stepCount,
                                    "activityType" to currentStableActivityType,
                                    "magnitude" to avgMagnitude
                                )

                                events?.success(data)
                            }
                        }
                    }

                    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}
                }

                sensorManager.registerListener(
                    sensorEventListener,
                    accelerometer,
                    SensorManager.SENSOR_DELAY_GAME
                )
            }

            override fun onCancel(arguments: Any?) {
                sensorEventListener?.let {
                    sensorManager.unregisterListener(it)
                }
                sensorEventListener = null
            }
        })

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "$ACCELEROMETER_CHANNEL/control"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "start" -> {
                    stepCount = 0
                    result.success(null)
                }

                "stop" -> {
                    result.success(null)
                }

                "reset" -> {
                    stepCount = 0
                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun setupGpsChannel(flutterEngine: FlutterEngine) {
        val locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        val GPS_CHANNEL = "com.tuinstituto.fitness/gps"

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            GPS_CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "isGpsEnabled" -> {
                    val enabled = locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER) ||
                            locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER)
                    result.success(enabled)
                }
                "openLocationSettings" -> {
                    try {
                        val intent = Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS)
                        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        startActivity(intent)
                        result.success(true)
                    } catch (e: Exception) {
                        result.error("SETTINGS_ERROR", e.message, null)
                    }
                }
                "getCurrentLocation" -> {
                    if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED &&
                        ActivityCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED
                    ) {
                        result.error("PERMISSION_DENIED", "Location permission not granted", null)
                        return@setMethodCallHandler
                    }
                    val lastKnownGps = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER)
                    val lastKnownNetwork = locationManager.getLastKnownLocation(LocationManager.NETWORK_PROVIDER)
                    val bestLocation = if (lastKnownGps != null && lastKnownNetwork != null) {
                        if (lastKnownGps.time > lastKnownNetwork.time) lastKnownGps else lastKnownNetwork
                    } else {
                        lastKnownGps ?: lastKnownNetwork
                    }

                    // Ignorar la ubicación de caché si tiene más de 60 segundos de antigüedad
                    val age = if (bestLocation != null) System.currentTimeMillis() - bestLocation.time else Long.MAX_VALUE
                    if (bestLocation != null && age < 60000) {
                        result.success(mapOf(
                            "latitude" to bestLocation.latitude,
                            "longitude" to bestLocation.longitude,
                            "altitude" to bestLocation.altitude,
                            "speed" to bestLocation.speed,
                            "accuracy" to bestLocation.accuracy
                        ))
                    } else {
                        result.success(null)
                    }
                }
                else -> result.notImplemented()
            }
        }

        var locationListener: LocationListener? = null

        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "$GPS_CHANNEL/stream"
        ).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                if (ActivityCompat.checkSelfPermission(this@MainActivity, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED &&
                    ActivityCompat.checkSelfPermission(this@MainActivity, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED
                ) {
                    events?.error("PERMISSION_DENIED", "Location permission not granted", null)
                    return
                }

                locationListener = object : LocationListener {
                    override fun onLocationChanged(location: Location) {
                        sendLocation(location)
                    }

                    override fun onLocationChanged(locations: MutableList<Location>) {
                        if (locations.isNotEmpty()) {
                            sendLocation(locations.last())
                        }
                    }

                    private fun sendLocation(location: Location) {
                        val data = mapOf(
                            "latitude" to location.latitude,
                            "longitude" to location.longitude,
                            "altitude" to location.altitude,
                            "speed" to location.speed,
                            "accuracy" to location.accuracy
                        )
                        events?.success(data)
                    }

                    override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {}
                    override fun onProviderEnabled(provider: String) {}
                    override fun onProviderDisabled(provider: String) {}
                }

                try {
                    // Cambiamos minDistance a 0.0f para recibir actualizaciones constantes
                    // cada 1000ms sin importar si el desplazamiento es menor a 1 metro.
                    // Esto evita delays y aumenta la precisión de respuesta del GPS.
                    if (locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
                        locationManager.requestLocationUpdates(
                            LocationManager.GPS_PROVIDER,
                            1000L,
                            0.0f,
                            locationListener!!
                        )
                    }
                    if (locationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER)) {
                        locationManager.requestLocationUpdates(
                            LocationManager.NETWORK_PROVIDER,
                            1000L,
                            0.0f,
                            locationListener!!
                        )
                    }
                } catch (e: Exception) {
                    events?.error("GPS_ERROR", e.message, null)
                }
            }

            override fun onCancel(arguments: Any?) {
                locationListener?.let {
                    locationManager.removeUpdates(it)
                }
                locationListener = null
            }
        })
    }
}