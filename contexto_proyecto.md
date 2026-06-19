# CONTEXTO COMPLETO DEL PROYECTO

Generado automáticamente por export_context_flutter.dart


# ANÁLISIS DE ARQUITECTURA

## ACIERTOS

✅ Feature "activity" contiene data/domain/presentation.
✅ Feature "auth" contiene data/domain/presentation.


# ESTRUCTURA DEL PROYECTO

📄 .flutter-plugins-dependencies
📄 .gitignore
📄 .metadata
📄 README.md
📄 analysis_options.yaml
📁 android
    📄 .gitignore
    📁 app
        📄 build.gradle.kts
        📁 src
            📁 debug
                📄 AndroidManifest.xml
            📁 main
                📄 AndroidManifest.xml
                📁 java
                    📁 io
                        📁 flutter
                            📁 plugins
                                📄 GeneratedPluginRegistrant.java
                📁 kotlin
                    📁 com
                        📁 tuinstituto
                            📁 fitness_tracker
                                📄 MainActivity.kt
                📁 res
                    📁 drawable
                        📄 launch_background.xml
                    📁 drawable-v21
                        📄 launch_background.xml
                    📁 mipmap-hdpi
                        📄 ic_launcher.png
                    📁 mipmap-mdpi
                        📄 ic_launcher.png
                    📁 mipmap-xhdpi
                        📄 ic_launcher.png
                    📁 mipmap-xxhdpi
                        📄 ic_launcher.png
                    📁 mipmap-xxxhdpi
                        📄 ic_launcher.png
                    📁 values
                        📄 styles.xml
                    📁 values-night
                        📄 styles.xml
            📁 profile
                📄 AndroidManifest.xml
    📄 build.gradle.kts
    📄 fitness_tracker_android.iml
    📁 gradle
        📁 wrapper
            📄 gradle-wrapper.jar
            📄 gradle-wrapper.properties
    📄 gradle.properties
    📄 gradlew
    📄 gradlew.bat
    📄 local.properties
    📄 settings.gradle.kts
📄 fitness_tracker.iml
📁 ios
    📄 .gitignore
    📁 Flutter
        📄 AppFrameworkInfo.plist
        📄 Debug.xcconfig
        📄 Generated.xcconfig
        📄 Release.xcconfig
        📁 ephemeral
            📄 flutter_lldb_helper.py
            📄 flutter_lldbinit
            📄 flutter_native_integration.env
        📄 flutter_export_environment.sh
    📁 Runner
        📄 AppDelegate.swift
        📁 Assets.xcassets
            📁 AppIcon.appiconset
                📄 Contents.json
                📄 Icon-App-1024x1024@1x.png
                📄 Icon-App-20x20@1x.png
                📄 Icon-App-20x20@2x.png
                📄 Icon-App-20x20@3x.png
                📄 Icon-App-29x29@1x.png
                📄 Icon-App-29x29@2x.png
                📄 Icon-App-29x29@3x.png
                📄 Icon-App-40x40@1x.png
                📄 Icon-App-40x40@2x.png
                📄 Icon-App-40x40@3x.png
                📄 Icon-App-60x60@2x.png
                📄 Icon-App-60x60@3x.png
                📄 Icon-App-76x76@1x.png
                📄 Icon-App-76x76@2x.png
                📄 Icon-App-83.5x83.5@2x.png
            📁 LaunchImage.imageset
                📄 Contents.json
                📄 LaunchImage.png
                📄 LaunchImage@2x.png
                📄 LaunchImage@3x.png
                📄 README.md
        📁 Base.lproj
            📄 LaunchScreen.storyboard
            📄 Main.storyboard
        📄 GeneratedPluginRegistrant.h
        📄 GeneratedPluginRegistrant.m
        📄 Info.plist
        📄 Runner-Bridging-Header.h
        📄 SceneDelegate.swift
    📁 Runner.xcodeproj
        📄 project.pbxproj
        📁 project.xcworkspace
            📄 contents.xcworkspacedata
            📁 xcshareddata
                📄 IDEWorkspaceChecks.plist
                📄 WorkspaceSettings.xcsettings
        📁 xcshareddata
            📁 xcschemes
                📄 Runner.xcscheme
    📁 Runner.xcworkspace
        📄 contents.xcworkspacedata
        📁 xcshareddata
            📄 IDEWorkspaceChecks.plist
            📄 WorkspaceSettings.xcsettings
    📁 RunnerTests
        📄 RunnerTests.swift
📁 lib
    📁 core
        📁 platform
            📄 platform_channels.dart
    📁 features
        📁 activity
            📁 data
                📁 datasources
                    📄 activity_datasource_impl.dart
                📁 services
                    📄 tts_service.dart
            📁 domain
                📁 entities
                    📄 activity_state.dart
                    📄 fall_event.dart
            📁 presentation
                📁 bloc
                    📄 activity_bloc.dart
                📁 pages
                    📄 activity_page.dart
        📁 auth
            📁 data
                📁 datasources
                    📄 accelerometer_datasource.dart
                    📄 biometric_datasource.dart
            📁 domain
                📁 entities
                    📄 auth_result.dart
                    📄 step_data.dart
                📁 usecases
                    📄 authenticate_user.dart
            📁 presentation
                📁 bloc
                    📄 auth_bloc.dart
                📁 pages
                    📄 login_page.dart
            📁 steps
                📁 presentation
                    📁 widgets
                        📄 step_counter_widget.dart
            📁 tracking
                📁 data
                    📁 datasources
                        📄 gps_datasource.dart
                📁 domain
                    📁 entities
                        📄 location_point.dart
                📁 presentation
                    📁 widgets
                        📄 route_map_widget.dart
    📄 injection_container.dart
    📄 main.dart
📄 pubspec.yaml
📁 test
    📄 widget_test.dart


# CONTENIDO DE LOS ARCHIVOS

          
================================================
📄 ARCHIVO: .flutter-plugins-dependencies
================================================

{"info":"This is a generated file; do not edit or check into version control.","plugins":{"ios":[{"name":"activity_recognition_flutter","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\activity_recognition_flutter-6.0.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_apple","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_apple-9.4.10\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"sensors_plus","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sensors_plus-5.0.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"android":[{"name":"activity_recognition_flutter","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\activity_recognition_flutter-6.0.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_android","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_android-12.1.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"sensors_plus","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sensors_plus-5.0.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"macos":[{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"linux":[],"windows":[{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_windows","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_windows-0.2.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"web":[{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","dependencies":[],"dev_dependency":false},{"name":"permission_handler_html","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_html-0.1.3+5\\\\","dependencies":[],"dev_dependency":false},{"name":"sensors_plus","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sensors_plus-5.0.1\\\\","dependencies":[],"dev_dependency":false}]},"dependencyGraph":[{"name":"activity_recognition_flutter","dependencies":[]},{"name":"flutter_tts","dependencies":[]},{"name":"permission_handler","dependencies":["permission_handler_android","permission_handler_apple","permission_handler_html","permission_handler_windows"]},{"name":"permission_handler_android","dependencies":[]},{"name":"permission_handler_apple","dependencies":[]},{"name":"permission_handler_html","dependencies":[]},{"name":"permission_handler_windows","dependencies":[]},{"name":"sensors_plus","dependencies":[]}],"date_created":"2026-06-19 15:51:52.785846","version":"3.41.9","swift_package_manager_enabled":{"ios":false,"macos":false}}

          
================================================
📄 ARCHIVO: .gitignore
================================================

# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.build/
.buildlog/
.history
.svn/
.swiftpm/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins-dependencies
.pub-cache/
.pub/
/build/
/coverage/

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release


          
================================================
📄 ARCHIVO: .metadata
================================================

# This file tracks properties of this Flutter project.
# Used by Flutter tool to assess capabilities and perform upgrades etc.
#
# This file should be version controlled and should not be manually edited.

version:
  revision: "00b0c91f06209d9e4a41f71b7a512d6eb3b9c694"
  channel: "stable"

project_type: app

# Tracks metadata for the flutter migrate command
migration:
  platforms:
    - platform: root
      create_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
      base_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
    - platform: android
      create_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
      base_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
    - platform: ios
      create_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
      base_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
    - platform: linux
      create_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
      base_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
    - platform: macos
      create_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
      base_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
    - platform: web
      create_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
      base_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
    - platform: windows
      create_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694
      base_revision: 00b0c91f06209d9e4a41f71b7a512d6eb3b9c694

  # User provided section

  # List of Local paths (relative to this file) that should be
  # ignored by the migrate tool.
  #
  # Files that are not part of the templates will be ignored by default.
  unmanaged_files:
    - 'lib/main.dart'
    - 'ios/Runner.xcodeproj/project.pbxproj'


          
================================================
📄 ARCHIVO: analysis_options.yaml
================================================

# This file configures the analyzer, which statically analyzes Dart code to
# check for errors, warnings, and lints.
#
# The issues identified by the analyzer are surfaced in the UI of Dart-enabled
# IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
# invoked from the command line by running `flutter analyze`.

# The following line activates a set of recommended lints for Flutter apps,
# packages, and plugins designed to encourage good coding practices.
include: package:flutter_lints/flutter.yaml

analyzer:
  language:
    strict-inference: true
    strict-raw-types: true

linter:
  # The lint rules applied to this project can be customized in the
  # section below to disable rules from the `package:flutter_lints/flutter.yaml`
  # included above or to enable additional rules. A list of all available lints
  # and their documentation is published at https://dart.dev/lints.
  #
  # Instead of disabling a lint rule for the entire project in the
  # section below, it can also be suppressed for a single line of code
  # or a specific dart file by using the `// ignore: name_of_lint` and
  # `// ignore_for_file: name_of_lint` syntax on the line or in the file
  # producing the lint.
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options


          
================================================
📄 ARCHIVO: android\.gitignore
================================================

gradle-wrapper.jar
/.gradle
/captures/
/gradlew
/gradlew.bat
/local.properties
GeneratedPluginRegistrant.java
.cxx/

# Remember to never publicly share your keystore.
# See https://flutter.dev/to/reference-keystore
key.properties
**/*.keystore
**/*.jks


          
================================================
📄 ARCHIVO: ios\.gitignore
================================================

**/dgph
*.mode1v3
*.mode2v3
*.moved-aside
*.pbxuser
*.perspectivev3
**/*sync/
.sconsign.dblite
.tags*
**/.vagrant/
**/DerivedData/
Icon?
**/Pods/
**/.symlinks/
profile
xcuserdata
**/.generated/
Flutter/App.framework
Flutter/Flutter.framework
Flutter/Flutter.podspec
Flutter/Generated.xcconfig
Flutter/ephemeral/
Flutter/app.flx
Flutter/app.zip
Flutter/flutter_assets/
Flutter/flutter_export_environment.sh
ServiceDefinitions.json
Runner/GeneratedPluginRegistrant.*

# Exceptions to above rules.
!default.mode1v3
!default.mode2v3
!default.pbxuser
!default.perspectivev3


          
================================================
📄 ARCHIVO: ios\Flutter\Debug.xcconfig
================================================

#include "Generated.xcconfig"


          
================================================
📄 ARCHIVO: ios\Flutter\Generated.xcconfig
================================================

// This is a generated file; do not edit or check into version control.
FLUTTER_ROOT=C:\Users\andre\AppData\Local\Android\Sdk\flutter
FLUTTER_APPLICATION_PATH=C:\Users\andre\fitness_tracker
FLUTTER_FRAMEWORK_SWIFT_PACKAGE_PATH=C:\Users\andre\fitness_tracker\ios\Flutter\ephemeral\Packages\.packages\FlutterFramework
COCOAPODS_PARALLEL_CODE_SIGN=true
FLUTTER_TARGET=lib\main.dart
FLUTTER_BUILD_DIR=build
FLUTTER_BUILD_NAME=1.0.0
FLUTTER_BUILD_NUMBER=1.0.0
EXCLUDED_ARCHS[sdk=iphonesimulator*]=i386
EXCLUDED_ARCHS[sdk=iphoneos*]=armv7
DART_OBFUSCATION=false
TRACK_WIDGET_CREATION=true
TREE_SHAKE_ICONS=false
PACKAGE_CONFIG=.dart_tool/package_config.json


          
================================================
📄 ARCHIVO: ios\Flutter\Release.xcconfig
================================================

#include "Generated.xcconfig"


          
================================================
📄 ARCHIVO: ios\Runner\Assets.xcassets\AppIcon.appiconset\Contents.json
================================================

{
  "images" : [
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-App-20x20@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-App-20x20@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-App-29x29@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-App-29x29@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-App-29x29@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-App-40x40@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-App-40x40@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-App-60x60@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-App-60x60@3x.png",
      "scale" : "3x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-App-20x20@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-App-20x20@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-App-29x29@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-App-29x29@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-App-40x40@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-App-40x40@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-App-76x76@1x.png",
      "scale" : "1x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-App-76x76@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "83.5x83.5",
      "idiom" : "ipad",
      "filename" : "Icon-App-83.5x83.5@2x.png",
      "scale" : "2x"
    },
    {
      "size" : "1024x1024",
      "idiom" : "ios-marketing",
      "filename" : "Icon-App-1024x1024@1x.png",
      "scale" : "1x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}


          
================================================
📄 ARCHIVO: ios\Runner\Assets.xcassets\LaunchImage.imageset\Contents.json
================================================

{
  "images" : [
    {
      "idiom" : "universal",
      "filename" : "LaunchImage.png",
      "scale" : "1x"
    },
    {
      "idiom" : "universal",
      "filename" : "LaunchImage@2x.png",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "filename" : "LaunchImage@3x.png",
      "scale" : "3x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}


          
================================================
📄 ARCHIVO: ios\Runner\Assets.xcassets\LaunchImage.imageset\README.md
================================================

# Launch Screen Assets

You can customize the launch screen with your own desired assets by replacing the image files in this directory.

You can also do it by opening your Flutter project's Xcode project with `open ios/Runner.xcworkspace`, selecting `Runner/Assets.xcassets` in the Project Navigator and dropping in the desired images.

          
================================================
📄 ARCHIVO: lib\core\platform\platform_channels.dart
================================================

/// Constantes para los nombres de Platform Channels
/// Centralizar nombres evita errores de tipeo
class PlatformChannels {
  // Prevenir instanciación
  PlatformChannels._();

  static const String biometric = 'com.tuinstituto.fitness/biometric';
  static const String accelerometer = 'com.tuinstituto.fitness/accelerometer';
  static const String gps = 'com.tuinstituto.fitness/gps';
}


          
================================================
📄 ARCHIVO: lib\features\activity\data\datasources\activity_datasource_impl.dart
================================================

import 'dart:async';
import 'dart:math';
import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../domain/entities/activity_state.dart';
import '../../domain/entities/fall_event.dart';

class ActivityDataSourceImpl {
  // Umbral de caída: 25 m/s²
  // Gravedad normal = 9.8. Un impacto real supera 20. 
  // 25 da margen contra falsos positivos por movimiento brusco.
  static const double _fallThreshold = 25.0;

  // Cooldown entre caídas: 2 segundos
  // Evita múltiples eventos del mismo impacto (rebote del dispositivo)
  static const Duration _fallCooldown = Duration(seconds: 2);

  DateTime? _lastFallTime;

  // ─── STREAM DE ACTIVIDAD ──────────────────────────────────────────
  // Usa activity_recognition_flutter que ya clasifica la actividad
  // internamente usando el Step Detector del SO. Más preciso que
  // procesar el acelerómetro crudo manualmente.
  Stream<ActivityState> get activityStream {
    return ActivityRecognition().activityStream().map((ActivityEvent event) {
      final type = _mapActivityType(event.type);
      return ActivityState(
        type: type,
        detectedAt: DateTime.now(),
      );
    });
  }

  UserActivityType _mapActivityType(ActivityType pluginType) {
    switch (pluginType) {
      case ActivityType.walking:
      case ActivityType.onFoot:
        return UserActivityType.walking;
      case ActivityType.running:
        return UserActivityType.running;
      case ActivityType.still:
        return UserActivityType.stationary;
      default:
        return UserActivityType.unknown;
    }
  }

  // ─── STREAM DE CAÍDAS ────────────────────────────────────────────
  // Usa sensors_plus para datos crudos del acelerómetro.
  // activity_recognition_flutter NO detecta caídas, por eso
  // necesitamos los dos plugins.
  Stream<FallEvent> get fallStream {
    return accelerometerEventStream().where((AccelerometerEvent e) {
      // Magnitud del vector resultante de los 3 ejes
      final double magnitude = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      final DateTime now = DateTime.now();

      // Filtro 1: ¿supera el umbral de impacto?
      if (magnitude < _fallThreshold) return false;

      // Filtro 2: cooldown para evitar eventos duplicados del mismo impacto
      if (_lastFallTime != null &&
          now.difference(_lastFallTime!) < _fallCooldown) {
        return false;
      }

      _lastFallTime = now;
      return true;
    }).map((AccelerometerEvent e) {
      final double magnitude = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      return FallEvent(
        magnitude: magnitude,
        occurredAt: DateTime.now(),
      );
    });
  }

  // ─── PERMISOS ────────────────────────────────────────────────────
  Future<bool> requestPermissions() async {
    // activityRecognition cubre el ACTIVITY_RECOGNITION del manifest
    // sensors cubre el BODY_SENSORS del manifest
    final activity = await Permission.activityRecognition.request();
    final sensors = await Permission.sensors.request();
    return activity.isGranted && sensors.isGranted;
  }
}

          
================================================
📄 ARCHIVO: lib\features\activity\data\services\tts_service.dart
================================================

import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();

  Future<void> init() async {
    await _tts.setLanguage('es-ES');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
  }

  Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.speak(text);
  }

  void dispose() {
    _tts.stop();
  }
}

          
================================================
📄 ARCHIVO: lib\features\activity\domain\entities\activity_state.dart
================================================

import 'package:equatable/equatable.dart';

/// Enum propio de la app (renombrado a UserActivityType
/// para evitar colisión con el enum ActivityType del plugin
/// activity_recognition_flutter)
enum UserActivityType {
  walking,
  running,
  stationary,
  unknown,
}

class ActivityState extends Equatable {
  final UserActivityType type;
  final DateTime detectedAt;

  const ActivityState({
    required this.type,
    required this.detectedAt,
  });

  /// Texto que se muestra en la UI
  String get label {
    switch (type) {
      case UserActivityType.walking:
        return 'Caminando';
      case UserActivityType.running:
        return 'Corriendo';
      case UserActivityType.stationary:
        return 'Detenido';
      case UserActivityType.unknown:
        return 'Detectando...';
    }
  }

  /// Texto que lee flutter_tts en voz alta
  String get voiceMessage {
    switch (type) {
      case UserActivityType.walking:
        return 'Estás caminando';
      case UserActivityType.running:
        return 'Estás corriendo';
      case UserActivityType.stationary:
        return 'Te has detenido';
      case UserActivityType.unknown:
        return '';
    }
  }

  @override
  List<Object?> get props => [type, detectedAt];
}

          
================================================
📄 ARCHIVO: lib\features\activity\domain\entities\fall_event.dart
================================================

import 'package:equatable/equatable.dart';

class FallEvent extends Equatable {
  final double magnitude;
  final DateTime occurredAt;

  const FallEvent({
    required this.magnitude,
    required this.occurredAt,
  });

  @override
  List<Object?> get props => [magnitude, occurredAt];
}

          
================================================
📄 ARCHIVO: lib\features\activity\presentation\bloc\activity_bloc.dart
================================================

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/datasources/activity_datasource_impl.dart';
import '../../domain/entities/activity_state.dart';
import '../../domain/entities/fall_event.dart';
import '../../data/services/tts_service.dart';

// ═══════════════════════════════════════════════════════════════
// EVENTOS
// ═══════════════════════════════════════════════════════════════

abstract class ActivityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// El usuario presionó "Iniciar"
class ActivityStarted extends ActivityEvent {}

/// El usuario presionó "Detener"
class ActivityStopped extends ActivityEvent {}

/// Llegó un nuevo estado del stream de actividad
class ActivityChanged extends ActivityEvent {
  final ActivityState state;
  ActivityChanged(this.state);

  @override
  List<Object?> get props => [state];
}

/// El acelerómetro detectó una caída
class FallDetected extends ActivityEvent {
  final FallEvent event;
  FallDetected(this.event);

  @override
  List<Object?> get props => [event];
}

/// El usuario respondió "Estoy bien" en el diálogo
class FallConfirmed extends ActivityEvent {}

/// El usuario respondió "Necesito ayuda" en el diálogo
class FallDismissed extends ActivityEvent {}

// ═══════════════════════════════════════════════════════════════
// ESTADOS
// ═══════════════════════════════════════════════════════════════

abstract class ActivityBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Estado inicial antes de iniciar el tracking
class ActivityInitial extends ActivityBlocState {}

/// Tracking activo con el estado actual del usuario
class ActivityTracking extends ActivityBlocState {
  final ActivityState current;
  ActivityTracking(this.current);

  @override
  List<Object?> get props => [current];
}

/// Se detectó una caída — la UI debe mostrar el diálogo
class FallAlert extends ActivityBlocState {
  final FallEvent event;
  FallAlert(this.event);

  @override
  List<Object?> get props => [event];
}

/// El usuario confirmó que está bien — volver al tracking
class FallResolved extends ActivityBlocState {}

// ═══════════════════════════════════════════════════════════════
// BLOC
// ═══════════════════════════════════════════════════════════════

class ActivityBloc extends Bloc<ActivityEvent, ActivityBlocState> {
  final ActivityDataSourceImpl _dataSource;
  final TtsService _ttsService;

  StreamSubscription<ActivityState>? _activitySub;
  StreamSubscription<FallEvent>? _fallSub;

  // ── Debounce de voz ──────────────────────────────────────────
  // Solo se anuncia un cambio si el nuevo estado se mantuvo
  // estable durante 3 segundos y es diferente al último anunciado.
  // Justificación: el acelerómetro oscila entre walking/stationary
  // en milisegundos al dar un paso. 3s garantiza estabilidad real.
  static const Duration _debounceDuration = Duration(seconds: 3);

  UserActivityType? _lastAnnouncedType;
  UserActivityType? _pendingType;
  DateTime? _pendingStateTime;

  ActivityBloc({
    required ActivityDataSourceImpl dataSource,
    required TtsService ttsService,
  })  : _dataSource = dataSource,
        _ttsService = ttsService,
        super(ActivityInitial()) {
    on<ActivityStarted>(_onStarted);
    on<ActivityStopped>(_onStopped);
    on<ActivityChanged>(_onActivityChanged);
    on<FallDetected>(_onFallDetected);
    on<FallConfirmed>(_onFallConfirmed);
    on<FallDismissed>(_onFallDismissed);
  }

  // ── Iniciar tracking ─────────────────────────────────────────
  Future<void> _onStarted(
    ActivityStarted event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.init();

    // Suscribirse al stream de actividad
    _activitySub = _dataSource.activityStream.listen((activityState) {
      add(ActivityChanged(activityState));
    });

    // Suscribirse al stream de caídas
    _fallSub = _dataSource.fallStream.listen((fallEvent) {
      add(FallDetected(fallEvent));
    });
  }

  // ── Detener tracking ─────────────────────────────────────────
  Future<void> _onStopped(
    ActivityStopped event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _cancelSubscriptions();
    emit(ActivityInitial());
  }

  // ── Nuevo estado de actividad ─────────────────────────────────
  void _onActivityChanged(
    ActivityChanged event,
    Emitter<ActivityBlocState> emit,
  ) {
    final incoming = event.state.type;

    if (incoming == _pendingType) {
      // El estado sigue siendo el mismo — ¿ya pasaron 3 segundos?
      final elapsed = DateTime.now().difference(_pendingStateTime!);
      if (elapsed >= _debounceDuration) {
        // Solo anunciar si cambió respecto al último anunciado
        if (incoming != _lastAnnouncedType &&
            incoming != UserActivityType.unknown) {
          _ttsService.speak(event.state.voiceMessage);
          _lastAnnouncedType = incoming;
        }
      }
    } else {
      // Estado diferente — reiniciar el contador de estabilidad
      _pendingType = incoming;
      _pendingStateTime = DateTime.now();
    }

    emit(ActivityTracking(event.state));
  }

  // ── Caída detectada ──────────────────────────────────────────
  Future<void> _onFallDetected(
    FallDetected event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak('¡Atención! Se detectó una posible caída. ¿Estás bien?');
    emit(FallAlert(event.event));
  }

  // ── Usuario respondió "Estoy bien" ───────────────────────────
  Future<void> _onFallConfirmed(
    FallConfirmed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak('Me alegra que estés bien. Continuando el seguimiento.');
    emit(FallResolved());
  }

  // ── Usuario respondió "Necesito ayuda" ───────────────────────
  Future<void> _onFallDismissed(
    FallDismissed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak('Entendido. Por favor busca ayuda de inmediato.');
    emit(FallResolved());
  }

  // ── Limpieza ──────────────────────────────────────────────────
  Future<void> _cancelSubscriptions() async {
    await _activitySub?.cancel();
    await _fallSub?.cancel();
    _activitySub = null;
    _fallSub = null;
  }

  @override
  Future<void> close() async {
    await _cancelSubscriptions();
    _ttsService.dispose();
    return super.close();
  }
}

          
================================================
📄 ARCHIVO: lib\features\activity\presentation\pages\activity_page.dart
================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/activity_bloc.dart';
import '../../domain/entities/activity_state.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  @override
  void initState() {
    super.initState();
    _requestPermissionsAndStart();
  }

  // Paso 9: solicitar permisos antes de iniciar
  Future<void> _requestPermissionsAndStart() async {
    final bloc = context.read<ActivityBloc>();
    // El datasource ya está dentro del bloc, disparamos el evento
    bloc.add(ActivityStarted());
  }

  // ── Diálogo de caída ────────────────────────────────────────
  void _showFallDialog(BuildContext context, FallAlert state) {
    bool showSecondary = false;
    Timer? secondaryTimer;

    showDialog<void>(
      context: context,
      barrierDismissible: false, // El usuario DEBE responder
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {

            // Timer de 15 segundos para mensaje secundario
            secondaryTimer ??= Timer(
              const Duration(seconds: 15),
              () {
                setDialogState(() {
                  showSecondary = true;
                });
              },
            );

            return AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.orange, size: 28),
                  SizedBox(width: 8),
                  Text('¿Estás bien?'),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Se detectó una posible caída.'),
                  const SizedBox(height: 8),

                  // Mensaje secundario que aparece a los 15 segundos
                  if (showSecondary)
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Text(
                        '¡Por favor responde! ¿Necesitas ayuda?',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
              actions: [
                // Botón "Estoy bien"
                TextButton(
                  onPressed: () {
                    secondaryTimer?.cancel();
                    context.read<ActivityBloc>().add(FallConfirmed());
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Estoy bien'),
                ),

                // Botón "Necesito ayuda"
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    secondaryTimer?.cancel();
                    context.read<ActivityBloc>().add(FallDismissed());
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Necesito ayuda'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detector de Actividad'),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
      ),
      body: BlocListener<ActivityBloc, ActivityBlocState>(
        listener: (context, state) {
          // Cuando el BLoC emite FallAlert → mostrar el diálogo
          if (state is FallAlert) {
            _showFallDialog(context, state);
          }
        },
        child: BlocBuilder<ActivityBloc, ActivityBlocState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Ícono según actividad
                  Icon(
                    _getIcon(state),
                    size: 100,
                    color: const Color(0xFF6366F1),
                  ),
                  const SizedBox(height: 24),

                  // Texto del estado actual
                  Text(
                    _getLabel(state),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Botón iniciar / detener
                  ElevatedButton.icon(
                    onPressed: () {
                      if (state is ActivityTracking) {
                        context.read<ActivityBloc>().add(ActivityStopped());
                      } else {
                        context.read<ActivityBloc>().add(ActivityStarted());
                      }
                    },
                    icon: Icon(
                      state is ActivityTracking ? Icons.stop : Icons.play_arrow,
                    ),
                    label: Text(
                      state is ActivityTracking ? 'Detener' : 'Iniciar',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state is ActivityTracking
                          ? Colors.red
                          : Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  IconData _getIcon(ActivityBlocState state) {
    if (state is ActivityTracking) {
      switch (state.current.type) {
        case UserActivityType.walking:
          return Icons.directions_walk;
        case UserActivityType.running:
          return Icons.directions_run;
        case UserActivityType.stationary:
          return Icons.accessibility_new;
        case UserActivityType.unknown:
          return Icons.help_outline;
      }
    }
    return Icons.fitness_center;
  }

  String _getLabel(ActivityBlocState state) {
    if (state is ActivityTracking) {
      return state.current.label;
    }
    return 'Presiona Iniciar';
  }
}

          
================================================
📄 ARCHIVO: lib\features\auth\data\datasources\accelerometer_datasource.dart
================================================

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/platform/platform_channels.dart';
import '../../domain/entities/step_data.dart';

/// DataSource para acelerómetro usando EventChannel
///
/// - EventChannel se usa para STREAMS de datos continuos
/// - A diferencia de MethodChannel (petición/respuesta),
///   EventChannel envía datos constantemente
abstract class AccelerometerDataSource {
  Stream<StepData> get stepStream;
  Future<void> startCounting();
  Future<void> stopCounting();
  Future<bool> requestPermissions();
}

class AccelerometerDataSourceImpl implements AccelerometerDataSource {
  /// EventChannel: para recibir stream de datos
  final EventChannel _eventChannel = const EventChannel(
    PlatformChannels.accelerometer
  );

  /// MethodChannel auxiliar: para control (start/stop)
  final MethodChannel _methodChannel = const MethodChannel(
    '${PlatformChannels.accelerometer}/control'
  );

  @override
  Stream<StepData> get stepStream {
    /// receiveBroadcastStream(): crea un stream que recibe
    /// datos continuamente desde el lado Android
    return _eventChannel.receiveBroadcastStream().map((event) {
      return StepData.fromMap(event as Map<dynamic, dynamic>);
    });
  }

  @override
  Future<void> startCounting() async {
    await _methodChannel.invokeMethod('start');
  }

  @override
  Future<void> stopCounting() async {
    await _methodChannel.invokeMethod('stop');
  }

  @override
  Future<bool> requestPermissions() async {
    final activityStatus = await Permission.activityRecognition.request();
    final sensorsStatus = await Permission.sensors.request();
    return activityStatus.isGranted && sensorsStatus.isGranted;
  }
}


          
================================================
📄 ARCHIVO: lib\features\auth\data\datasources\biometric_datasource.dart
================================================

import 'package:flutter/services.dart';
import '../../../../core/platform/platform_channels.dart';
import '../../domain/entities/auth_result.dart';

/// DataSource para autenticación biométrica usando Platform Channels
/// - Este es el LADO FLUTTER del Platform Channel
/// - Usamos MethodChannel porque es petición/respuesta
/// - El nombre del canal DEBE coincidir con el lado Android
abstract class BiometricDataSource {
  Future<bool> canAuthenticate();
  Future<AuthResult> authenticate();
}

class BiometricDataSourceImpl implements BiometricDataSource {
  /// MethodChannel: canal de comunicación Flutter ↔ Android
  /// El nombre debe ser exactamente igual en ambos lados
  final MethodChannel _channel = const MethodChannel(
    PlatformChannels.biometric
  );

  @override
  Future<bool> canAuthenticate() async {
    try {
      /// invokeMethod: envía un mensaje a Android y espera respuesta
      /// - Parámetro 1: nombre del método (debe coincidir en Android)
      /// - Retorna: un Future con la respuesta
      final result = await _channel.invokeMethod<bool>(
        'checkBiometricSupport'
      );

      return result ?? false;
    } on PlatformException catch (e) {
      print('Error verificando biometría: ${e.message}');
      return false;
    }
  }

  @override
  Future<AuthResult> authenticate() async {
    try {
      /// Llamamos al método 'authenticate' del lado Android
      final result = await _channel.invokeMethod<bool>('authenticate');

      return AuthResult(
        success: result ?? false,
        message: result == true ? 'Autenticación exitosa' : 'Autenticación fallida',
      );
    } on PlatformException catch (e) {
      return AuthResult(
        success: false,
        message: 'Error: ${e.message}',
      );
    }
  }
}


          
================================================
📄 ARCHIVO: lib\features\auth\domain\entities\auth_result.dart
================================================

import 'package:equatable/equatable.dart';

/// Resultado de la autenticación biométrica
class AuthResult extends Equatable {
  final bool success;
  final String? message;

  const AuthResult({
    required this.success,
    this.message,
  });

  @override
  List<Object?> get props => [success, message];
}


          
================================================
📄 ARCHIVO: lib\features\auth\domain\entities\step_data.dart
================================================

import 'package:equatable/equatable.dart';

/// Tipos de actividad detectados
enum ActivityType {
  stationary,  // Quieto
  walking,     // Caminando
  running,     // Corriendo
}

/// Datos del acelerómetro
class StepData extends Equatable {
  final int stepCount;
  final ActivityType activityType;
  final double magnitude;

  const StepData({
    required this.stepCount,
    required this.activityType,
    required this.magnitude,
  });

  /// Calorías estimadas (0.04 cal por paso)
  double get estimatedCalories => stepCount * 0.04;

  /// Factory para crear desde Map del Platform Channel
  factory StepData.fromMap(Map<dynamic, dynamic> map) {
    final activityTypeString = map['activityType'] as String;

    return StepData(
      stepCount: map['stepCount'] as int,
      activityType: _parseActivityType(activityTypeString),
      magnitude: (map['magnitude'] as num).toDouble(),
    );
  }

  static ActivityType _parseActivityType(String type) {
    switch (type) {
      case 'walking':
        return ActivityType.walking;
      case 'running':
        return ActivityType.running;
      default:
        return ActivityType.stationary;
    }
  }

  @override
  List<Object> get props => [stepCount, activityType, magnitude];
}


          
================================================
📄 ARCHIVO: lib\features\auth\domain\usecases\authenticate_user.dart
================================================

import '../entities/auth_result.dart';
import '../../data/datasources/biometric_datasource.dart';

/// Use Case: lógica de negocio de autenticación
class AuthenticateUser {
  final BiometricDataSource dataSource;

  AuthenticateUser(this.dataSource);

  Future<AuthResult> call() async {
    // Verificar si el dispositivo soporta biometría
    final canAuth = await dataSource.canAuthenticate();

    if (!canAuth) {
      return const AuthResult(
        success: false,
        message: 'Biometría no disponible',
      );
    }

    // Autenticar
    return await dataSource.authenticate();
  }
}


          
================================================
📄 ARCHIVO: lib\features\auth\presentation\bloc\auth_bloc.dart
================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/authenticate_user.dart';
import '../../domain/entities/auth_result.dart';

// EVENTS
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticateRequested extends AuthEvent {}

// STATES
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final AuthResult result;
  AuthSuccess(this.result);

  @override
  List<Object> get props => [result];
}
class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

// BLOC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUser authenticateUser;

  AuthBloc(this.authenticateUser) : super(AuthInitial()) {
    on<AuthenticateRequested>(_onAuthenticateRequested);
  }

  Future<void> _onAuthenticateRequested(
    AuthenticateRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final result = await authenticateUser();

      if (result.success) {
        emit(AuthSuccess(result));
      } else {
        emit(AuthFailure(result.message ?? 'Error desconocido'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}


          
================================================
📄 ARCHIVO: lib\features\auth\presentation\pages\login_page.dart
================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onAuthSuccess;

  const LoginPage({super.key, required this.onAuthSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            onAuthSuccess();
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.fitness_center,
                        size: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Fitness Tracker',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 48),

                      if (state is AuthLoading)
                        const CircularProgressIndicator(color: Colors.white)
                      else
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthenticateRequested());
                          },
                          icon: const Icon(Icons.fingerprint),
                          label: const Text('Autenticar con Huella'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6366F1),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


          
================================================
📄 ARCHIVO: lib\features\auth\steps\presentation\widgets\step_counter_widget.dart
================================================

import 'package:flutter/material.dart';
import 'dart:async';
import '../../../data/datasources/accelerometer_datasource.dart';
import '../../../domain/entities/step_data.dart';

/// Widget que muestra el contador de pasos
///
/// EXPLICACIÓN DIDÁCTICA:
/// - Usa StreamSubscription para escuchar el EventChannel
/// - Actualiza UI cada vez que llegan nuevos datos
class StepCounterWidget extends StatefulWidget {
  const StepCounterWidget({super.key});

  @override
  State<StepCounterWidget> createState() => _StepCounterWidgetState();
}

class _StepCounterWidgetState extends State<StepCounterWidget> {
  final AccelerometerDataSource _dataSource = AccelerometerDataSourceImpl();

  StreamSubscription<StepData>? _subscription;
  StepData? _currentData;
  bool _isTracking = false;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _toggleTracking() {
    if (_isTracking) {
      _stopTracking();
    } else {
      _startTracking();
    }
  }

  void _startTracking() async {
    // Solicitar permisos
    final hasPermission = await _dataSource.requestPermissions();
    if (!hasPermission) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Permisos de sensores denegados'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    await _dataSource.startCounting();

    // SUSCRIBIRSE AL STREAM
    _subscription = _dataSource.stepStream.listen(
      (data) {
        setState(() {
          _currentData = data;
        });
      },
      onError: (Object error) {
        print('Error en stream: $error');
      },
    );

    setState(() {
      _isTracking = true;
    });
  }

  void _stopTracking() async {
    await _dataSource.stopCounting();
    _subscription?.cancel();

    setState(() {
      _isTracking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Contador de Pasos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: _toggleTracking,
                  icon: Icon(_isTracking ? Icons.stop : Icons.play_arrow),
                  label: Text(_isTracking ? 'Detener' : 'Iniciar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isTracking ? Colors.red : Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const Divider(),

            // Contador
            Text(
              '${_currentData?.stepCount ?? 0}',
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6366F1),
              ),
            ),
            const Text('pasos', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 16),

            // Indicadores
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoChip(
                  icon: _getActivityIcon(_currentData?.activityType),
                  label: _getActivityLabel(_currentData?.activityType),
                  color: Colors.blue,
                ),
                _buildInfoChip(
                  icon: Icons.local_fire_department,
                  label: '${_currentData?.estimatedCalories.toStringAsFixed(1) ?? "0"} cal',
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  IconData _getActivityIcon(ActivityType? type) {
    switch (type) {
      case ActivityType.walking:
        return Icons.directions_walk;
      case ActivityType.running:
        return Icons.directions_run;
      case ActivityType.stationary:
        return Icons.accessibility_new;
      default:
        return Icons.help_outline;
    }
  }

  String _getActivityLabel(ActivityType? type) {
    switch (type) {
      case ActivityType.walking:
        return 'Caminando';
      case ActivityType.running:
        return 'Corriendo';
      case ActivityType.stationary:
        return 'Quieto';
      default:
        return 'Detectando...';
    }
  }
}


          
================================================
📄 ARCHIVO: lib\features\auth\tracking\data\datasources\gps_datasource.dart
================================================

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/platform/platform_channels.dart';
import '../../domain/entities/location_point.dart';

/// DataSource para GPS
///
/// EXPLICACIÓN DIDÁCTICA:
/// - Combina MethodChannel (operaciones puntuales)
/// - Con EventChannel (stream de ubicaciones)
/// abstract class GpsDataSource {
///   Future<LocationPoint?> getCurrentLocation();
///   Stream<LocationPoint> get locationStream;
///   Future<bool> isGpsEnabled();
///   Future<bool> requestPermissions();
/// }

abstract class GpsDataSource {
  Future<LocationPoint?> getCurrentLocation();
  Stream<LocationPoint> get locationStream;
  Future<bool> isGpsEnabled();
  Future<bool> requestPermissions();
}

class GpsDataSourceImpl implements GpsDataSource {
  final MethodChannel _methodChannel = const MethodChannel(
    PlatformChannels.gps
  );

  final EventChannel _eventChannel = const EventChannel(
    '${PlatformChannels.gps}/stream'
  );

  @override
  Future<LocationPoint?> getCurrentLocation() async {
    try {
      final result = await _methodChannel.invokeMethod('getCurrentLocation');
      if (result != null) {
        return LocationPoint.fromMap(result as Map<dynamic, dynamic>);
      }
      return null;
    } on PlatformException catch (e) {
      print('Error obteniendo ubicación: ${e.message}');
      return null;
    }
  }

  @override
  Stream<LocationPoint> get locationStream {
    return _eventChannel.receiveBroadcastStream().map((event) {
      return LocationPoint.fromMap(event as Map<dynamic, dynamic>);
    });
  }

  @override
  Future<bool> isGpsEnabled() async {
    try {
      return await _methodChannel.invokeMethod('isGpsEnabled') ?? false;
    } on PlatformException {
      return false;
    }
  }

  @override
  Future<bool> requestPermissions() async {
    final locationStatus = await Permission.location.request();
    if (!locationStatus.isGranted) {
      final whenInUseStatus = await Permission.locationWhenInUse.request();
      return whenInUseStatus.isGranted;
    }
    return locationStatus.isGranted;
  }
}


          
================================================
📄 ARCHIVO: lib\features\auth\tracking\domain\entities\location_point.dart
================================================

import 'package:equatable/equatable.dart';
import 'dart:math' as math;

/// Punto de ubicación GPS
class LocationPoint extends Equatable {
  final double latitude;
  final double longitude;
  final double altitude;
  final double speed;
  final double accuracy;
  final DateTime timestamp;

  const LocationPoint({
    required this.latitude,
    required this.longitude,
    this.altitude = 0,
    this.speed = 0,
    this.accuracy = 0,
    required this.timestamp,
  });

  factory LocationPoint.fromMap(Map<dynamic, dynamic> map) {
    return LocationPoint(
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      altitude: (map['altitude'] as num?)?.toDouble() ?? 0,
      speed: (map['speed'] as num?)?.toDouble() ?? 0,
      accuracy: (map['accuracy'] as num?)?.toDouble() ?? 0,
      timestamp: DateTime.now(),
    );
  }

  /// Calcular distancia a otro punto (fórmula Haversine)
  double distanceTo(LocationPoint other) {
    const earthRadius = 6371000.0; // metros

    final lat1Rad = latitude * math.pi / 180;
    final lat2Rad = other.latitude * math.pi / 180;
    final deltaLat = (other.latitude - latitude) * math.pi / 180;
    final deltaLon = (other.longitude - longitude) * math.pi / 180;

    final a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
              math.cos(lat1Rad) * math.cos(lat2Rad) *
              math.sin(deltaLon / 2) * math.sin(deltaLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  @override
  List<Object?> get props => [latitude, longitude, timestamp];
}

/// Representa una ruta completa
class Route {
  final List<LocationPoint> points;
  final DateTime startTime;
  DateTime? endTime;

  Route({
    List<LocationPoint>? points,
    DateTime? startTime,
  }) : points = points ?? [],
       startTime = startTime ?? DateTime.now();

  void addPoint(LocationPoint point) {
    points.add(point);
  }

  void finish() {
    endTime = DateTime.now();
  }

  double get totalDistance {
    if (points.length < 2) return 0;

    double distance = 0;
    for (int i = 1; i < points.length; i++) {
      distance += points[i - 1].distanceTo(points[i]);
    }
    return distance;
  }

  double get distanceKm => totalDistance / 1000;

  Duration get duration {
    final end = endTime ?? DateTime.now();
    return end.difference(startTime);
  }

  double get averageSpeed {
    final hours = duration.inSeconds / 3600;
    if (hours == 0) return 0;
    return distanceKm / hours;
  }

  double get estimatedCalories => distanceKm * 60;
}


          
================================================
📄 ARCHIVO: lib\features\auth\tracking\presentation\widgets\route_map_widget.dart
================================================


import 'package:flutter/material.dart' hide Route;
import 'dart:async';
import '../../data/datasources/gps_datasource.dart';
import '../../domain/entities/location_point.dart';

class RouteMapWidget extends StatefulWidget {
  const RouteMapWidget({super.key});

  @override
  State<RouteMapWidget> createState() => _RouteMapWidgetState();
}

class _RouteMapWidgetState extends State<RouteMapWidget> {
  final GpsDataSource _dataSource = GpsDataSourceImpl();
  final Route _route = Route();

  StreamSubscription<LocationPoint>? _subscription;
  bool _isTracking = false;
  String _statusMessage = 'Presiona Iniciar';

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _toggleTracking() async {
    if (_isTracking) {
      _stopTracking();
    } else {
      await _startTracking();
    }
  }

  Future<void> _startTracking() async {
    final hasPermission = await _dataSource.requestPermissions();
    if (!hasPermission) {
      setState(() {
        _statusMessage = 'Permisos denegados';
      });
      return;
    }

    final gpsEnabled = await _dataSource.isGpsEnabled();
    if (!gpsEnabled) {
      setState(() {
        _statusMessage = 'Activa el GPS';
      });
      return;
    }

    _subscription = _dataSource.locationStream.listen(
      (LocationPoint point) {
        print('📍 GPS: ${point.latitude}, ${point.longitude}, acc=${point.accuracy}m');

        if (_route.points.isEmpty) {
          setState(() {
            _route.addPoint(point);
            _statusMessage = 'Tracking - ${_route.points.length} puntos';
          });
        } else {
          final lastPoint = _route.points.last;
          final distance = lastPoint.distanceTo(point);

          if (distance >= 2) {
            setState(() {
              _route.addPoint(point);
              _statusMessage = 'Tracking - ${_route.points.length} puntos';
            });
          }
        }
      },
      onError: (Object error) {
        print('❌ GPS Error: $error');
        setState(() {
          _statusMessage = 'Error: $error';
        });
      },
    );

    setState(() {
      _isTracking = true;
    });
  }

  void _stopTracking() {
    _subscription?.cancel();
    _route.finish();

    setState(() {
      _isTracking = false;
      _statusMessage = 'Ruta finalizada';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ruta GPS',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                      onPressed: _toggleTracking,
                      icon: Icon(_isTracking ? Icons.stop : Icons.play_arrow),
                      label: Text(_isTracking ? 'Detener' : 'Iniciar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isTracking ? Colors.red : Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _statusMessage,
                  style: TextStyle(
                    color: _isTracking ? Colors.green : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Mapa (Canvas)
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CustomPaint(
                painter: RoutePainter(route: _route),
                size: Size.infinite,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Métricas
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMetric(
                  icon: Icons.straighten,
                  value: '${_route.distanceKm.toStringAsFixed(2)} km',
                  label: 'Distancia',
                ),
                _buildMetric(
                  icon: Icons.timer,
                  value: _formatDuration(_route.duration),
                  label: 'Tiempo',
                ),
                _buildMetric(
                  icon: Icons.speed,
                  value: '${_route.averageSpeed.toStringAsFixed(1)} km/h',
                  label: 'Velocidad',
                ),
                _buildMetric(
                  icon: Icons.local_fire_department,
                  value: '${_route.estimatedCalories.toStringAsFixed(0)}',
                  label: 'Calorías',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF6366F1)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// CustomPainter para dibujar la ruta
class RoutePainter extends CustomPainter {
  final Route route;

  RoutePainter({required this.route});

  @override
  void paint(Canvas canvas, Size size) {
    if (route.points.isEmpty) {
      final textPainter = TextPainter(
        text: const TextSpan(
          text: 'Sin datos de ruta',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          (size.width - textPainter.width) / 2,
          (size.height - textPainter.height) / 2,
        ),
      );
      return;
    }

    // Calcular bounds
    double minLat = route.points.first.latitude;
    double maxLat = route.points.first.latitude;
    double minLon = route.points.first.longitude;
    double maxLon = route.points.first.longitude;

    for (final point in route.points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLon) minLon = point.longitude;
      if (point.longitude > maxLon) maxLon = point.longitude;
    }

    final padding = 20.0;
    final drawWidth = size.width - padding * 2;
    final drawHeight = size.height - padding * 2;

    Offset toPixel(LocationPoint point) {
      final latRange = maxLat - minLat;
      final lonRange = maxLon - minLon;

      final x = lonRange == 0
          ? drawWidth / 2
          : ((point.longitude - minLon) / lonRange) * drawWidth;
      final y = latRange == 0
          ? drawHeight / 2
          : ((maxLat - point.latitude) / latRange) * drawHeight;

      return Offset(x + padding, y + padding);
    }

    // Dibujar línea
    final linePaint = Paint()
      ..color = const Color(0xFF6366F1)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(toPixel(route.points.first).dx, toPixel(route.points.first).dy);

    for (int i = 1; i < route.points.length; i++) {
      final pixel = toPixel(route.points[i]);
      path.lineTo(pixel.dx, pixel.dy);
    }

    canvas.drawPath(path, linePaint);

    // Punto inicio (verde)
    final startPaint = Paint()..color = Colors.green;
    canvas.drawCircle(toPixel(route.points.first), 8, startPaint);

    // Punto final (rojo)
    final endPaint = Paint()..color = Colors.red;
    canvas.drawCircle(toPixel(route.points.last), 8, endPaint);
  }

  @override
  bool shouldRepaint(RoutePainter oldDelegate) {
    return oldDelegate.route.points.length != route.points.length;
  }
}


          
================================================
📄 ARCHIVO: lib\injection_container.dart
================================================

import 'package:get_it/get_it.dart';
import 'features/activity/data/datasources/activity_datasource_impl.dart';
import 'features/activity/data/services/tts_service.dart';
import 'features/activity/presentation/bloc/activity_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {
  // Servicios
  sl.registerLazySingleton<TtsService>(() => TtsService());

  // Datasources
  sl.registerLazySingleton<ActivityDataSourceImpl>(
    () => ActivityDataSourceImpl(),
  );

  // BLoCs
  sl.registerFactory<ActivityBloc>(
    () => ActivityBloc(
      dataSource: sl<ActivityDataSourceImpl>(),
      ttsService: sl<TtsService>(),
    ),
  );
}

          
================================================
📄 ARCHIVO: lib\main.dart
================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';

// Auth (lo que ya tenías)
import 'features/auth/data/datasources/biometric_datasource.dart';
import 'features/auth/domain/usecases/authenticate_user.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';

// Actividad (lo nuevo)
import 'features/activity/presentation/bloc/activity_bloc.dart';
import 'features/activity/presentation/pages/activity_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar inyección de dependencias
  initDependencies();

  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    final biometricDataSource = BiometricDataSourceImpl();
    final authenticateUser = AuthenticateUser(biometricDataSource);

    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => AuthBloc(authenticateUser),
        child: const AuthWrapper(),
      ),
    );
  }
}

// ── Auth Wrapper (igual que antes) ───────────────────────────────
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isAuthenticated = false;

  void _onAuthSuccess() {
    setState(() {
      _isAuthenticated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isAuthenticated) {
      // Autenticado → ir a la página de actividad
      return BlocProvider(
        create: (_) => sl<ActivityBloc>(),
        child: const ActivityPage(),
      );
    }
    return LoginPage(onAuthSuccess: _onAuthSuccess);
  }
}

          
================================================
📄 ARCHIVO: pubspec.yaml
================================================

name: fitness_tracker
description: App de fitness con detección de actividad y voz
version: 1.0.0
publish_to: 'none'

environment:
  sdk: '>=3.2.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  # Gestión de estado
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5

  # Inyección de dependencias
  get_it: ^7.6.4

  # Manejo de permisos
  permission_handler: ^11.0.1

  # Acelerómetro crudo - para detección de caídas
  sensors_plus: ^5.0.1

  # Clasificación de actividad (caminar / correr / quieto)
  activity_recognition_flutter: ^6.0.0

  # Síntesis de voz
  flutter_tts: ^4.0.2

  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true

          
================================================
📄 ARCHIVO: README.md
================================================

# fitness_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


          
================================================
📄 ARCHIVO: test\widget_test.dart
================================================

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fitness_tracker/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FitnessApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}


