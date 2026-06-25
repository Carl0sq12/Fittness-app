# CONTEXTO COMPLETO DEL PROYECTO

Generado automáticamente por export_context_flutter.dart


# ANÁLISIS DE ARQUITECTURA

## ACIERTOS

✅ Feature "activity" contiene data/domain/presentation.
✅ Feature "auth" contiene data/domain/presentation.
✅ Feature "history" contiene data/domain/presentation.


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
        📁 history
            📁 data
                📁 repositories
                    📄 activity_repository_impl.dart
            📁 domain
                📁 entities
                    📄 activity_record.dart
                📁 repositories
                    📄 activity_repository.dart
            📁 presentation
                📁 bloc
                    📄 history_bloc.dart
                📁 pages
                    📄 history_page.dart
    📄 injection_container.dart
    📄 main.dart
📄 pubspec.yaml
📁 test
    📄 widget_test.dart


# CONTENIDO DE LOS ARCHIVOS

          
================================================
📄 ARCHIVO: .flutter-plugins-dependencies
================================================

{"info":"This is a generated file; do not edit or check into version control.","plugins":{"ios":[{"name":"activity_recognition_flutter","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\activity_recognition_flutter-6.0.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"geolocator_apple","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\geolocator_apple-2.3.14\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false},{"name":"local_auth_darwin","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\local_auth_darwin-1.6.1\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_apple","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_apple-9.4.10\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"sensors_plus","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sensors_plus-5.0.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"sqflite_darwin","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sqflite_darwin-2.4.2\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false}],"android":[{"name":"activity_recognition_flutter","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\activity_recognition_flutter-6.0.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"flutter_plugin_android_lifecycle","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_plugin_android_lifecycle-2.0.35\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"geolocator_android","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\geolocator_android-4.6.2\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"local_auth_android","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\local_auth_android-1.0.56\\\\","native_build":true,"dependencies":["flutter_plugin_android_lifecycle"],"dev_dependency":false},{"name":"permission_handler_android","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_android-12.1.0\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"sensors_plus","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sensors_plus-5.0.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"sqflite_android","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sqflite_android-2.4.2+3\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"macos":[{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"geolocator_apple","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\geolocator_apple-2.3.14\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false},{"name":"local_auth_darwin","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\local_auth_darwin-1.6.1\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false},{"name":"sqflite_darwin","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sqflite_darwin-2.4.2\\\\","shared_darwin_source":true,"native_build":true,"dependencies":[],"dev_dependency":false}],"linux":[],"windows":[{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"geolocator_windows","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\geolocator_windows-0.2.5\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"local_auth_windows","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\local_auth_windows-1.0.11\\\\","native_build":true,"dependencies":[],"dev_dependency":false},{"name":"permission_handler_windows","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_windows-0.2.1\\\\","native_build":true,"dependencies":[],"dev_dependency":false}],"web":[{"name":"flutter_tts","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\flutter_tts-4.2.5\\\\","dependencies":[],"dev_dependency":false},{"name":"geolocator_web","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\geolocator_web-3.0.0\\\\","dependencies":[],"dev_dependency":false},{"name":"permission_handler_html","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\permission_handler_html-0.1.3+5\\\\","dependencies":[],"dev_dependency":false},{"name":"sensors_plus","path":"C:\\\\Users\\\\andre\\\\AppData\\\\Local\\\\Pub\\\\Cache\\\\hosted\\\\pub.dev\\\\sensors_plus-5.0.1\\\\","dependencies":[],"dev_dependency":false}]},"dependencyGraph":[{"name":"activity_recognition_flutter","dependencies":[]},{"name":"flutter_plugin_android_lifecycle","dependencies":[]},{"name":"flutter_tts","dependencies":[]},{"name":"geolocator","dependencies":["geolocator_android","geolocator_apple","geolocator_web","geolocator_windows"]},{"name":"geolocator_android","dependencies":[]},{"name":"geolocator_apple","dependencies":[]},{"name":"geolocator_web","dependencies":[]},{"name":"geolocator_windows","dependencies":[]},{"name":"local_auth","dependencies":["local_auth_android","local_auth_darwin","local_auth_windows"]},{"name":"local_auth_android","dependencies":["flutter_plugin_android_lifecycle"]},{"name":"local_auth_darwin","dependencies":[]},{"name":"local_auth_windows","dependencies":[]},{"name":"permission_handler","dependencies":["permission_handler_android","permission_handler_apple","permission_handler_html","permission_handler_windows"]},{"name":"permission_handler_android","dependencies":[]},{"name":"permission_handler_apple","dependencies":[]},{"name":"permission_handler_html","dependencies":[]},{"name":"permission_handler_windows","dependencies":[]},{"name":"sensors_plus","dependencies":[]},{"name":"sqflite","dependencies":["sqflite_android","sqflite_darwin"]},{"name":"sqflite_android","dependencies":[]},{"name":"sqflite_darwin","dependencies":[]}],"date_created":"2026-06-23 17:50:11.412839","version":"3.44.0","swift_package_manager_enabled":{"ios":false,"macos":false}}

          
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
//class PlatformChannels {
  // Prevenir instanciación
 // PlatformChannels._();

  //static const String biometric = 'com.tuinstituto.fitness/biometric';
  //static const String accelerometer = 'com.tuinstituto.fitness/accelerometer';
  //static const String gps = 'com.tuinstituto.fitness/gps';
//}

/// Archivo conservado por referencia histórica.
/// Los Platform Channels han sido reemplazados por plugins:
/// - local_auth       → autenticación biométrica
/// - geolocator       → GPS y ubicación
/// - sensors_plus     → acelerómetro
class PlatformChannels {
  PlatformChannels._();

  // Ya no se usan activamente; eliminados biometric, accelerometer, gps.
  // Si en el futuro se necesita un canal nativo personalizado, definirlo aquí.
}


          
================================================
📄 ARCHIVO: lib\features\activity\data\datasources\activity_datasource_impl.dart
================================================

import 'dart:async';
import 'dart:math';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../domain/entities/activity_state.dart';
import '../../domain/entities/fall_event.dart';
import '../../../auth/domain/entities/step_data.dart' show ActivityType;
import '../../../auth/data/datasources/accelerometer_datasource.dart';

class ActivityUpdate {
  final ActivityState state;
  final int stepCount;
  const ActivityUpdate({required this.state, required this.stepCount});
}

class ActivityDataSourceImpl {
  final AccelerometerDataSource _accelerometerDataSource;

  ActivityDataSourceImpl(this._accelerometerDataSource);

  // Umbral reducido a 28.0: detecta caídas desde posición estática.
  // El buffer de 3 muestras promediaba el pico y lo perdía → eliminado.
  static const double _fallThreshold = 28.0;
  static const Duration _fallCooldown = Duration(seconds: 3);
  DateTime? _lastFallTime;

  Future<void> startTracking() async {
    _accelerometerDataSource.resetStepCount();
    await _accelerometerDataSource.startCounting();
  }

  Future<void> stopTracking() async {
    await _accelerometerDataSource.stopCounting();
  }

  Stream<ActivityUpdate> get activityStream {
    return _accelerometerDataSource.stepStream.map((stepData) {
      UserActivityType type;
      switch (stepData.activityType) {
        case ActivityType.walking:
          type = UserActivityType.walking;
          break;
        case ActivityType.running:
          type = UserActivityType.running;
          break;
        case ActivityType.stationary:
          type = UserActivityType.stationary;
          break;
      }
      return ActivityUpdate(
        state: ActivityState(type: type, detectedAt: DateTime.now()),
        stepCount: stepData.stepCount,
      );
    });
  }

  Stream<FallEvent> get fallStream {
    return accelerometerEventStream().where((AccelerometerEvent e) {
      // Sin buffer: evalúa cada muestra directamente para no perder el pico.
      final double magnitude = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      final DateTime now = DateTime.now();

      if (magnitude < _fallThreshold) return false;

      if (_lastFallTime != null &&
          now.difference(_lastFallTime!) < _fallCooldown) {
        return false;
      }

      _lastFallTime = now;
      return true;
    }).map((AccelerometerEvent e) {
      final double magnitude = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      return FallEvent(magnitude: magnitude, occurredAt: DateTime.now());
    });
  }

  Future<bool> requestPermissions() async {
    final activity = await Permission.activityRecognition.request();
    final sensors  = await Permission.sensors.request();
    return activity.isGranted && sensors.isGranted;
  }
}

          
================================================
📄 ARCHIVO: lib\features\activity\data\services\tts_service.dart
================================================

import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;

  /// Inicializa el motor TTS una sola vez.
  /// Llamadas repetidas son ignoradas para evitar reinicializaciones
  /// que silencian el audio en Android.
  Future<void> init() async {
    if (_initialized) return;
    await _tts.setLanguage('es-ES');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
    // No bloquear el hilo mientras habla (importante en Android)
    await _tts.awaitSpeakCompletion(false);
    _initialized = true;
  }

  /// Reproduce el texto en voz alta.
  /// NO se llama stop() antes de speak() porque en Android eso silencia
  /// el motor TTS antes de que pueda emitir audio.
  Future<void> speak(String text) async {
    if (text.isEmpty) return;
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
import '../../../history/domain/entities/activity_record.dart';
import '../../../history/domain/repositories/activity_repository.dart';

// ═══ EVENTOS ════════════════════════════════════════════════════════

abstract class ActivityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActivityStarted  extends ActivityEvent {}
class ActivityStopped  extends ActivityEvent {}

class ActivityChanged extends ActivityEvent {
  final ActivityState state;
  final int stepCount;
  ActivityChanged(this.state, this.stepCount);
  @override
  List<Object?> get props => [state, stepCount];
}

class FallDetected extends ActivityEvent {
  final FallEvent event;
  FallDetected(this.event);
  @override
  List<Object?> get props => [event];
}

class FallConfirmed extends ActivityEvent {}
class FallDismissed  extends ActivityEvent {}

// ═══ ESTADOS ════════════════════════════════════════════════════════

abstract class ActivityBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ActivityInitial extends ActivityBlocState {}

class ActivityTracking extends ActivityBlocState {
  final ActivityState current;
  final int steps;
  final double distanceKm;
  final double calories;
  final Duration elapsed;
  final int fallCount; // ← NUEVO: caídas acumuladas en la sesión

  ActivityTracking({
    required this.current,
    this.steps = 0,
    this.distanceKm = 0,
    this.calories = 0,
    this.elapsed = Duration.zero,
    this.fallCount = 0, // ← NUEVO
  });

  @override
  List<Object?> get props =>
      [current, steps, distanceKm, calories, elapsed, fallCount];
}

class FallAlert extends ActivityBlocState {
  final FallEvent event;
  FallAlert(this.event);
  @override
  List<Object?> get props => [event];
}

class FallResolved extends ActivityBlocState {}

class ActivitySessionSaved extends ActivityBlocState {
  final ActivityRecord record;
  ActivitySessionSaved(this.record);
  @override
  List<Object?> get props => [record];
}

// ═══ BLOC ════════════════════════════════════════════════════════════

class ActivityBloc extends Bloc<ActivityEvent, ActivityBlocState> {
  final ActivityDataSourceImpl _dataSource;
  final TtsService _ttsService;
  final ActivityRepository _repository;

  StreamSubscription<ActivityUpdate>? _activitySub;
  StreamSubscription<FallEvent>? _fallSub;
  Timer? _sessionTimer;
  Timer? _debounceTimer;

  DateTime? _sessionStart;
  int _sessionSteps     = 0;
  double _sessionDistanceKm = 0;
  Duration _sessionElapsed  = Duration.zero;
  int _sessionFallCount = 0; // ← NUEVO
  final Map<UserActivityType, int> _activityCount = {};

  // Último estado de tracking guardado para restaurar tras FallAlert
  ActivityTracking? _lastTrackingState;

  static const Duration _debounceDuration = Duration(milliseconds: 300);
  UserActivityType? _lastAnnouncedType;
  UserActivityType? _pendingType;

  ActivityBloc({
    required ActivityDataSourceImpl dataSource,
    required TtsService ttsService,
    required ActivityRepository repository,
  })  : _dataSource = dataSource,
        _ttsService = ttsService,
        _repository = repository,
        super(ActivityInitial()) {
    on<ActivityStarted>(_onStarted);
    on<ActivityStopped>(_onStopped);
    on<ActivityChanged>(_onActivityChanged);
    on<FallDetected>(_onFallDetected);
    on<FallConfirmed>(_onFallConfirmed);
    on<FallDismissed>(_onFallDismissed);
  }

  Future<void> _onStarted(
    ActivityStarted event,
    Emitter<ActivityBlocState> emit,
  ) async {
    final hasPermission = await _dataSource.requestPermissions();
    if (!hasPermission) return;

    await _ttsService.init();

    _sessionStart         = DateTime.now();
    _sessionSteps         = 0;
    _sessionDistanceKm    = 0;
    _sessionElapsed       = Duration.zero;
    _sessionFallCount     = 0; // ← NUEVO
    _lastTrackingState    = null;
    _activityCount.clear();

    await _dataSource.startTracking();

    final initial = ActivityTracking(
      current: ActivityState(
        type: UserActivityType.unknown,
        detectedAt: DateTime.now(),
      ),
    );
    _lastTrackingState = initial;
    emit(initial);

    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state is ActivityTracking) {
        final current = state as ActivityTracking;
        _sessionElapsed = DateTime.now().difference(_sessionStart!);
        final updated = ActivityTracking(
          current: current.current,
          steps: _sessionSteps,
          distanceKm: _sessionDistanceKm,
          calories: _sessionSteps * 0.04,
          elapsed: _sessionElapsed,
          fallCount: _sessionFallCount, // ← NUEVO
        );
        _lastTrackingState = updated;
        emit(updated);
      }
    });

    _activitySub = _dataSource.activityStream.listen((update) {
      add(ActivityChanged(update.state, update.stepCount));
    });

    _fallSub = _dataSource.fallStream.listen((fallEvent) {
      add(FallDetected(fallEvent));
    });
  }

  Future<void> _onStopped(
    ActivityStopped event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _cancelSubscriptions();
    await _dataSource.stopTracking();

    if (_sessionStart == null) {
      emit(ActivityInitial());
      return;
    }

    final endTime = DateTime.now();
    final duration = endTime.difference(_sessionStart!);

    final dominant = _activityCount.entries.isEmpty
        ? 'stationary'
        : (_activityCount.entries
              .reduce((a, b) => a.value >= b.value ? a : b)
              .key
              .name);

    final record = ActivityRecord(
      activityType: dominant,
      steps: _sessionSteps,
      distanceKm: _sessionDistanceKm,
      calories: _sessionSteps * 0.04,
      duration: duration,
      startedAt: _sessionStart!,
      endedAt: endTime,
      fallCount: _sessionFallCount, // ← NUEVO
    );

    await _repository.insert(record);
    emit(ActivitySessionSaved(record));

    await Future<void>.delayed(const Duration(seconds: 2));
    emit(ActivityInitial());
  }

  void _onActivityChanged(
    ActivityChanged event,
    Emitter<ActivityBlocState> emit,
  ) {
    // Si hay un FallAlert activo, actualizar solo los contadores internos
    // sin emitir estado para no pisar el diálogo.
    final incoming = event.state.type;
    _sessionSteps      = event.stepCount;
    _sessionDistanceKm = _sessionSteps * 0.00075;

    if (incoming != UserActivityType.unknown) {
      _activityCount[incoming] = (_activityCount[incoming] ?? 0) + 1;
    }

    if (state is FallAlert) return;

    if (incoming != _pendingType) {
      _debounceTimer?.cancel();
      _pendingType = incoming;
      if (incoming != UserActivityType.unknown) {
        _debounceTimer = Timer(_debounceDuration, () {
          final pending = _pendingType;
          if (pending != null &&
              pending != _lastAnnouncedType &&
              pending != UserActivityType.unknown) {
            _ttsService.speak(_voiceMessageFor(pending));
            _lastAnnouncedType = pending;
          }
        });
      }
    }

    final updated = ActivityTracking(
      current: event.state,
      steps: _sessionSteps,
      distanceKm: _sessionDistanceKm,
      calories: _sessionSteps * 0.04,
      elapsed: _sessionElapsed,
      fallCount: _sessionFallCount, // ← NUEVO
    );
    _lastTrackingState = updated;
    emit(updated);
  }

  Future<void> _onFallDetected(
    FallDetected event,
    Emitter<ActivityBlocState> emit,
  ) async {
    _sessionFallCount++; // ← NUEVO: contabilizar la caída
    _debounceTimer?.cancel();
    _pendingType = null;
    await _ttsService.speak(
        '¡Atención! Se detectó una posible caída. ¿Estás bien?');
    emit(FallAlert(event.event));
  }

  Future<void> _onFallConfirmed(
    FallConfirmed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak(
        'Me alegra que estés bien. Continuando el seguimiento.');
    // Restaurar el estado de tracking con el fallCount actualizado
    if (_lastTrackingState != null) {
      final restored = ActivityTracking(
        current: _lastTrackingState!.current,
        steps: _sessionSteps,
        distanceKm: _sessionDistanceKm,
        calories: _sessionSteps * 0.04,
        elapsed: _sessionElapsed,
        fallCount: _sessionFallCount,
      );
      _lastTrackingState = restored;
      emit(restored);
    } else {
      emit(FallResolved());
    }
  }

  Future<void> _onFallDismissed(
    FallDismissed event,
    Emitter<ActivityBlocState> emit,
  ) async {
    await _ttsService.speak(
        'Entendido. Por favor busca ayuda de inmediato.');
    if (_lastTrackingState != null) {
      final restored = ActivityTracking(
        current: _lastTrackingState!.current,
        steps: _sessionSteps,
        distanceKm: _sessionDistanceKm,
        calories: _sessionSteps * 0.04,
        elapsed: _sessionElapsed,
        fallCount: _sessionFallCount,
      );
      _lastTrackingState = restored;
      emit(restored);
    } else {
      emit(FallResolved());
    }
  }

  String _voiceMessageFor(UserActivityType type) {
    switch (type) {
      case UserActivityType.walking:   return 'Estás caminando';
      case UserActivityType.running:   return 'Estás corriendo';
      case UserActivityType.stationary: return 'Te has detenido';
      case UserActivityType.unknown:   return '';
    }
  }

  Future<void> _cancelSubscriptions() async {
    _sessionTimer?.cancel();
    _sessionTimer = null;
    await _activitySub?.cancel();
    await _fallSub?.cancel();
    _activitySub = null;
    _fallSub = null;
    _debounceTimer?.cancel();
    _debounceTimer = null;
    _lastAnnouncedType = null;
    _pendingType = null;
  }

  @override
  Future<void> close() async {
    await _cancelSubscriptions();
    await _dataSource.stopTracking();
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
import '../../data/datasources/activity_datasource_impl.dart';
import '../../../../../injection_container.dart';

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

  Future<void> _requestPermissionsAndStart() async {
    final datasource = sl<ActivityDataSourceImpl>();
    final granted = await datasource.requestPermissions();
    if (!mounted) return;
    if (granted) {
      context.read<ActivityBloc>().add(ActivityStarted());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Permisos denegados. Activa "Actividad física" y "Sensores corporales" en Ajustes.',
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 6),
        ),
      );
    }
  }

  void _showFallDialog(BuildContext context, FallAlert state) {
    bool showSecondary = false;
    Timer? secondaryTimer;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            secondaryTimer ??= Timer(const Duration(seconds: 15), () {
              setDialogState(() => showSecondary = true);
            });

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
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    secondaryTimer?.cancel();
                    context.read<ActivityBloc>().add(FallConfirmed());
                    Navigator.pop(dialogContext);
                  },
                  child: const Text('Estoy bien'),
                ),
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
      resizeToAvoidBottomInset: false,
      body: BlocListener<ActivityBloc, ActivityBlocState>(
        listener: (context, state) {
          if (state is FallAlert) {
            _showFallDialog(context, state);
          }
          if (state is ActivitySessionSaved) {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.white),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Sesión guardada: ${state.record.steps} pasos · '
                          '${state.record.distanceKm.toStringAsFixed(2)} km · '
                          '${state.record.calories.toStringAsFixed(0)} cal'
                          '${state.record.fallCount > 0 ? ' · ${state.record.fallCount} caída${state.record.fallCount > 1 ? 's' : ''}' : ''}',
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
          }
        },
        child: BlocBuilder<ActivityBloc, ActivityBlocState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      _getIcon(state),
                      size: 100,
                      color: const Color(0xFF6366F1),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      _getLabel(state),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 32),

                    if (state is ActivityTracking) ...[
                      _buildStatsRow(state),
                      const SizedBox(height: 8),
                      Text(
                        '⏱ ${_formatDuration(state.elapsed)}',
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      // Caídas detectadas en sesión, solo si hay al menos una
                      if (state.fallCount > 0) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.orange.shade300),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.warning_amber_rounded,
                                  size: 16,
                                  color: Colors.orange.shade700),
                              const SizedBox(width: 6),
                              Text(
                                '${state.fallCount} caída${state.fallCount > 1 ? 's' : ''} detectada${state.fallCount > 1 ? 's' : ''} en esta sesión',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 32),
                    ],

                    if (state is ActivitySessionSaved) ...[
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.green, size: 48),
                            const SizedBox(height: 8),
                            const Text(
                              'Sesión guardada en historial',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],

                    ElevatedButton.icon(
                      onPressed: state is ActivitySessionSaved
                          ? null
                          : () {
                              if (state is ActivityTracking) {
                                context
                                    .read<ActivityBloc>()
                                    .add(ActivityStopped());
                              } else {
                                _requestPermissionsAndStart();
                              }
                            },
                      icon: Icon(
                        state is ActivityTracking
                            ? Icons.stop
                            : Icons.play_arrow,
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
                            horizontal: 40, vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatsRow(ActivityTracking state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem(Icons.directions_walk, state.steps.toString(), 'pasos'),
          _statItem(
              Icons.straighten, state.distanceKm.toStringAsFixed(2), 'km'),
          _statItem(Icons.local_fire_department,
              state.calories.toStringAsFixed(0), 'cal'),
          // Caídas en la fila de stats con ícono naranja para distinguirlo
          _statItem(
            Icons.warning_amber_rounded,
            state.fallCount.toString(),
            'caídas',
            color: state.fallCount > 0
                ? Colors.orange.shade700
                : Colors.grey[400]!,
          ),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String label,
      {Color? color}) {
    final c = color ?? const Color(0xFF6366F1);
    return Column(
      children: [
        Icon(icon, color: c, size: 20),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: c)),
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
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
    if (state is ActivitySessionSaved) return Icons.check_circle;
    return Icons.fitness_center;
  }

  String _getLabel(ActivityBlocState state) {
    if (state is ActivityTracking) return state.current.label;
    if (state is ActivitySessionSaved) return 'Guardando...';
    return 'Presiona Iniciar';
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) return '${h}h ${m}m';
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

          
================================================
📄 ARCHIVO: lib\features\auth\data\datasources\accelerometer_datasource.dart
================================================

import 'dart:async';
import 'dart:math';
import 'package:permission_handler/permission_handler.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../domain/entities/step_data.dart';

abstract class AccelerometerDataSource {
  Stream<StepData> get stepStream;
  Future<void> startCounting();
  Future<void> stopCounting();
  Future<bool> requestPermissions();
  void resetStepCount();
}

class AccelerometerDataSourceImpl implements AccelerometerDataSource {
  StreamSubscription<AccelerometerEvent>? _accelSub;
  final StreamController<StepData> _controller =
      StreamController<StepData>.broadcast();

  int _stepCount = 0;
  bool _aboveThreshold = false;
  DateTime? _lastStepTime;

  // Lista corta: solo para conteo en tiempo real (pasos visibles rápido).
  final List<DateTime> _recentSteps = <DateTime>[];

  // Lista separada: solo para clasificar actividad (más estable).
  final List<DateTime> _classifySteps = <DateTime>[];

  static const double _stepThresholdUp = 11.8;
  static const double _stepThresholdDown = 10.2;
  static const int _minMsBetweenSteps = 380;

  // Ventana corta: pasos en tiempo real.
  static const Duration _stepRateWindow = Duration(seconds: 2);

  // Ventana larga SOLO para clasificar caminar/correr: más estable.
  static const Duration _classifyWindow = Duration(seconds: 3);

  // Original: estable para quieto vs caminar.
  static const Duration _walkingHoldTime = Duration(milliseconds: 2500);

  @override
  Stream<StepData> get stepStream => _controller.stream;

  @override
  void resetStepCount() {
    _stepCount = 0;
    _aboveThreshold = false;
    _lastStepTime = null;
    _recentSteps.clear();
    _classifySteps.clear();
  }

  @override
  Future<void> startCounting() async {
    await _accelSub?.cancel();
    _accelSub = null;

    _accelSub = accelerometerEventStream(
      samplingPeriod: SensorInterval.uiInterval,
    ).listen((AccelerometerEvent e) {
      final double mag = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);
      final DateTime now = DateTime.now();

      final bool cooldownOk = _lastStepTime == null ||
          now.difference(_lastStepTime!).inMilliseconds >= _minMsBetweenSteps;

      if (mag > _stepThresholdUp && !_aboveThreshold && cooldownOk) {
        _aboveThreshold = true;
        _stepCount++;
        _lastStepTime = now;
        // Se agrega a ambas listas.
        _recentSteps.add(now);
        _classifySteps.add(now);
      } else if (mag < _stepThresholdDown) {
        _aboveThreshold = false;
      }

      // Limpia cada lista con su propia ventana.
      _recentSteps.removeWhere(
        (DateTime t) => now.difference(t) > _stepRateWindow,
      );
      _classifySteps.removeWhere(
        (DateTime t) => now.difference(t) > _classifyWindow,
      );

      final ActivityType activity = _classifyActivity(now);
      _controller.add(
        StepData(
          stepCount: _stepCount,
          activityType: activity,
          magnitude: mag,
        ),
      );
    });
  }

  ActivityType _classifyActivity(DateTime now) {
    if (_lastStepTime == null) {
      return ActivityType.stationary;
    }

    final Duration sinceLastStep = now.difference(_lastStepTime!);
    if (sinceLastStep > _walkingHoldTime) {
      return ActivityType.stationary;
    }

    // Usa la ventana larga para clasificar: mucho más estable.
    // Con 4s y pasos consistentes, un paso de más/menos no cambia nada.
    final double stepsPerSecond =
        _classifySteps.length / _classifyWindow.inSeconds;

    // Con ventana de 4s el umbral baja un poco porque
    // la tasa promediada es más real que con 2s.
    if (stepsPerSecond >= 2.0) {
      return ActivityType.running;
    }

    return ActivityType.walking;
  }

  @override
  Future<void> stopCounting() async {
    await _accelSub?.cancel();
    _accelSub = null;
    _recentSteps.clear();
    _classifySteps.clear();
  }

  @override
  Future<bool> requestPermissions() async {
    final PermissionStatus activity =
        await Permission.activityRecognition.request();
    final PermissionStatus sensors = await Permission.sensors.request();
    return activity.isGranted && sensors.isGranted;
  }

  void dispose() {
    stopCounting();
    _controller.close();
  }
}

          
================================================
📄 ARCHIVO: lib\features\auth\data\datasources\biometric_datasource.dart
================================================

import 'package:local_auth/local_auth.dart';
import '../../domain/entities/auth_result.dart';

abstract class BiometricDataSource {
  Future<bool> canAuthenticate();
  Future<AuthResult> authenticate();
}

/// Implementación con el plugin local_auth.
/// Reemplaza completamente el MethodChannel anterior.
class BiometricDataSourceImpl implements BiometricDataSource {
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  Future<bool> canAuthenticate() async {
    try {
      // Verifica si el dispositivo soporta biometría Y tiene registros
      final bool canCheck = await _auth.canCheckBiometrics;
      final bool isSupported = await _auth.isDeviceSupported();
      return canCheck && isSupported;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<AuthResult> authenticate() async {
    try {
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Usa tu huella para ingresar a Fitness Tracker',
        options: const AuthenticationOptions(
          biometricOnly: false, // Permite PIN como fallback
          stickyAuth: true,     // No cancela si el usuario sale de la app
        ),
      );

      return AuthResult(
        success: didAuthenticate,
        message: didAuthenticate
            ? 'Autenticación exitosa'
            : 'Autenticación cancelada',
      );
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'Error de autenticación: $e',
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

enum ActivityType {
  stationary,
  walking,
  running,
}

class StepData extends Equatable {
  final int stepCount;
  final ActivityType activityType;
  final double magnitude;

  const StepData({
    required this.stepCount,
    required this.activityType,
    required this.magnitude,
  });

  double get estimatedCalories => stepCount * 0.04;

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
import '../../../../../injection_container.dart';

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
  final AccelerometerDataSource _dataSource = sl<AccelerometerDataSource>();

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
        color: color.withValues(alpha: 0.1),
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

import 'dart:async';

import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform;
import 'package:geolocator/geolocator.dart';

import '../../domain/entities/location_point.dart';

abstract class GpsDataSource {
  Future<LocationPoint?> getCurrentLocation();
  Stream<LocationPoint> get locationStream;
  Future<bool> isGpsEnabled();
  Future<bool> requestPermissions();
  Future<bool> openLocationSettings();
}

class GpsDataSourceImpl implements GpsDataSource {
  static const LocationSettings _locationSettings = LocationSettings(
    accuracy: LocationAccuracy.best,
    distanceFilter: 0,
    timeLimit: Duration(seconds: 15),
  );

  static AndroidSettings get _androidSettings => AndroidSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 0,
        intervalDuration: const Duration(milliseconds: 300),
        forceLocationManager: false,
      );

  static AppleSettings get _appleSettings => AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        activityType: ActivityType.fitness,
        distanceFilter: 0,
        pauseLocationUpdatesAutomatically: false,
        showBackgroundLocationIndicator: true,
      );

  LocationSettings get _platformSettings {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _androidSettings;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _appleSettings;
    }
    return _locationSettings;
  }

  Stream<LocationPoint>? _sharedStream;

  @override
  Stream<LocationPoint> get locationStream {
    _sharedStream ??= Geolocator.getPositionStream(
      locationSettings: _platformSettings,
    ).where((Position p) {
      return p.accuracy <= 35.0;
    }).map(_positionToPoint).asBroadcastStream();

    return _sharedStream!;
  }

  @override
  Future<LocationPoint?> getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        timeLimit: const Duration(seconds: 10),
      );

      if (position.accuracy > 35.0) return null;

      return _positionToPoint(position);
    } on TimeoutException {
      final Position? last = await Geolocator.getLastKnownPosition();
      if (last == null) return null;
      if (last.accuracy > 35.0) return null;

      return _positionToPoint(last);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> isGpsEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> requestPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  @override
  Future<bool> openLocationSettings() async {
    return Geolocator.openLocationSettings();
  }

  LocationPoint _positionToPoint(Position p) {
    return LocationPoint(
      latitude: p.latitude,
      longitude: p.longitude,
      altitude: p.altitude,
      speed: p.speed < 0 ? 0 : p.speed,
      accuracy: p.accuracy,
      timestamp: p.timestamp,
    );
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
import '../../../../../injection_container.dart';

class RouteMapWidget extends StatefulWidget {
  const RouteMapWidget({super.key});

  @override
  State<RouteMapWidget> createState() => _RouteMapWidgetState();
}

class _RouteMapWidgetState extends State<RouteMapWidget> {
  final GpsDataSource _dataSource = sl<GpsDataSource>();

  Route _route = Route();
  GpsKalmanFilter _kalmanFilter = GpsKalmanFilter();

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
      _showPermissionDeniedDialog();
      return;
    }

    final gpsEnabled = await _dataSource.isGpsEnabled();

    if (!gpsEnabled) {
      setState(() {
        _statusMessage = 'GPS desactivado';
      });

      final shouldOpen = await _showGpsDisabledDialog();

      if (shouldOpen) {
        await _dataSource.openLocationSettings();
      }

      return;
    }

    setState(() {
      _route = Route();
      _kalmanFilter = GpsKalmanFilter();
      _isTracking = true;
      _statusMessage = 'Buscando señal GPS...';
    });

    final initialPoint = await _dataSource.getCurrentLocation();

    if (initialPoint != null && _isTracking && initialPoint.accuracy <= 35) {
      final filteredInitial = _kalmanFilter.filter(initialPoint);

      setState(() {
        _route.addPoint(filteredInitial);
        _statusMessage = 'Tracking - ${_route.points.length} puntos';
      });
    }

    _subscription = _dataSource.locationStream.listen(
      (LocationPoint point) {
        if (point.accuracy > 35) {
          return;
        }

        final filteredPoint = _kalmanFilter.filter(point);

        if (_route.points.isEmpty) {
          setState(() {
            _route.addPoint(filteredPoint);
            _statusMessage = 'Tracking - ${_route.points.length} puntos';
          });
          return;
        }

        final lastPoint = _route.points.last;
        final distance = lastPoint.distanceTo(filteredPoint);

        if (distance >= 0.5) {
          setState(() {
            _route.addPoint(filteredPoint);
            _statusMessage = 'Tracking - ${_route.points.length} puntos';
          });
        }
      },
      onError: (Object error) {
        setState(() {
          _statusMessage = 'Error: $error';
        });
      },
    );
  }

  void _stopTracking() {
    _subscription?.cancel();
    _subscription = null;
    _route.finish();

    setState(() {
      _isTracking = false;
      _statusMessage = 'Ruta finalizada';
    });
  }

  Future<bool> _showGpsDisabledDialog() async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.location_off, color: Colors.red),
                  SizedBox(width: 8),
                  Text('GPS Desactivado'),
                ],
              ),
              content: const Text(
                'El servicio de ubicación está desactivado. Para registrar tu ruta, necesitas activarlo.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Activar'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  void _showPermissionDeniedDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.security, color: Colors.red),
              SizedBox(width: 8),
              Text('Permiso Denegado'),
            ],
          ),
          content: const Text(
            'El permiso de ubicación es indispensable para trazar tu ruta. Actívalo en los ajustes de la aplicación.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
                  value: _route.estimatedCalories.toStringAsFixed(0),
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
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
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

    const padding = 20.0;
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

    final linePaint = Paint()
      ..color = const Color(0xFF6366F1)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    final firstPixel = toPixel(route.points.first);
    path.moveTo(firstPixel.dx, firstPixel.dy);

    for (int i = 1; i < route.points.length; i++) {
      final pixel = toPixel(route.points[i]);
      path.lineTo(pixel.dx, pixel.dy);
    }

    canvas.drawPath(path, linePaint);

    final startPaint = Paint()..color = Colors.green;
    canvas.drawCircle(toPixel(route.points.first), 8, startPaint);

    final endPaint = Paint()..color = Colors.red;
    canvas.drawCircle(toPixel(route.points.last), 8, endPaint);
  }

  @override
  bool shouldRepaint(RoutePainter oldDelegate) {
    return true;
  }
}

class GpsKalmanFilter {
  double? _lat;
  double? _lng;
  double _variance = -1.0;

  static const double _processNoise = 8.0e-10;

  LocationPoint filter(LocationPoint point) {
    if (_lat == null || _lng == null || _variance < 0) {
      _lat = point.latitude;
      _lng = point.longitude;
      _variance =
          (point.accuracy / 111111.0) * (point.accuracy / 111111.0);
      return point;
    }

    final predictedVariance = _variance + _processNoise;

    final accuracyDegrees = point.accuracy / 111111.0;
    final r = accuracyDegrees * accuracyDegrees;

    final k = predictedVariance / (predictedVariance + r);

    _lat = _lat! + k * (point.latitude - _lat!);
    _lng = _lng! + k * (point.longitude - _lng!);
    _variance = (1.0 - k) * predictedVariance;

    return LocationPoint(
      latitude: _lat!,
      longitude: _lng!,
      altitude: point.altitude,
      speed: point.speed,
      accuracy: point.accuracy,
      timestamp: point.timestamp,
    );
  }
}

          
================================================
📄 ARCHIVO: lib\features\history\data\repositories\activity_repository_impl.dart
================================================

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../domain/entities/activity_record.dart';
import '../../domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  static Database? _db;
  static const String _tableName = 'activity_records';

  Future<Database> get _database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fitness_tracker.db');

    return await openDatabase(
      path,
      version: 2, // ← subir versión para migración
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id              INTEGER PRIMARY KEY AUTOINCREMENT,
            activityType    TEXT    NOT NULL,
            steps           INTEGER NOT NULL DEFAULT 0,
            distanceKm      REAL    NOT NULL DEFAULT 0,
            calories        REAL    NOT NULL DEFAULT 0,
            durationSeconds INTEGER NOT NULL DEFAULT 0,
            startedAt       TEXT    NOT NULL,
            endedAt         TEXT,
            notes           TEXT,
            fallCount       INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Agrega la columna a registros existentes sin borrar datos
          await db.execute(
            'ALTER TABLE $_tableName ADD COLUMN fallCount INTEGER NOT NULL DEFAULT 0',
          );
        }
      },
    );
  }

  @override
  Future<int> insert(ActivityRecord record) async {
    final db = await _database;
    return await db.insert(
      _tableName,
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<ActivityRecord>> getAll() async {
    final db = await _database;
    final maps = await db.query(_tableName, orderBy: 'startedAt DESC');
    return maps.map((m) => ActivityRecord.fromMap(m)).toList();
  }

  @override
  Future<ActivityRecord?> getById(int id) async {
    final db = await _database;
    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return ActivityRecord.fromMap(maps.first);
  }

  @override
  Future<int> update(ActivityRecord record) async {
    final db = await _database;
    return await db.update(
      _tableName,
      record.toMap(),
      where: 'id = ?',
      whereArgs: [record.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    final db = await _database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> deleteAll() async {
    final db = await _database;
    await db.delete(_tableName);
  }
}

          
================================================
📄 ARCHIVO: lib\features\history\domain\entities\activity_record.dart
================================================

import 'package:equatable/equatable.dart';

class ActivityRecord extends Equatable {
  final int? id;
  final String activityType;
  final int steps;
  final double distanceKm;
  final double calories;
  final Duration duration;
  final DateTime startedAt;
  final DateTime? endedAt;
  final String? notes;
  final int fallCount; // ← NUEVO

  const ActivityRecord({
    this.id,
    required this.activityType,
    required this.steps,
    required this.distanceKm,
    required this.calories,
    required this.duration,
    required this.startedAt,
    this.endedAt,
    this.notes,
    this.fallCount = 0, // ← NUEVO
  });

  ActivityRecord copyWith({
    int? id,
    String? activityType,
    int? steps,
    double? distanceKm,
    double? calories,
    Duration? duration,
    DateTime? startedAt,
    DateTime? endedAt,
    String? notes,
    int? fallCount, // ← NUEVO
  }) {
    return ActivityRecord(
      id: id ?? this.id,
      activityType: activityType ?? this.activityType,
      steps: steps ?? this.steps,
      distanceKm: distanceKm ?? this.distanceKm,
      calories: calories ?? this.calories,
      duration: duration ?? this.duration,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      notes: notes ?? this.notes,
      fallCount: fallCount ?? this.fallCount, // ← NUEVO
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'activityType': activityType,
      'steps': steps,
      'distanceKm': distanceKm,
      'calories': calories,
      'durationSeconds': duration.inSeconds,
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
      'notes': notes,
      'fallCount': fallCount, // ← NUEVO
    };
  }

  factory ActivityRecord.fromMap(Map<String, dynamic> map) {
    return ActivityRecord(
      id: map['id'] as int?,
      activityType: map['activityType'] as String,
      steps: map['steps'] as int,
      distanceKm: (map['distanceKm'] as num).toDouble(),
      calories: (map['calories'] as num).toDouble(),
      duration: Duration(seconds: map['durationSeconds'] as int),
      startedAt: DateTime.parse(map['startedAt'] as String),
      endedAt: map['endedAt'] != null
          ? DateTime.parse(map['endedAt'] as String)
          : null,
      notes: map['notes'] as String?,
      fallCount: (map['fallCount'] as int?) ?? 0, // ← NUEVO
    );
  }

  String get formattedDuration {
    final h = duration.inHours;
    final m = duration.inMinutes.remainder(60);
    final s = duration.inSeconds.remainder(60);
    if (h > 0) return '${h}h ${m}m';
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get activityLabel {
    switch (activityType) {
      case 'walking': return 'Caminata';
      case 'running': return 'Carrera';
      default:        return 'Actividad';
    }
  }

  @override
  List<Object?> get props => [
    id, activityType, steps, distanceKm, calories,
    duration, startedAt, endedAt, notes, fallCount,
  ];
}

          
================================================
📄 ARCHIVO: lib\features\history\domain\repositories\activity_repository.dart
================================================

import '../entities/activity_record.dart';

abstract class ActivityRepository {
  Future<int> insert(ActivityRecord record);
  Future<List<ActivityRecord>> getAll();
  Future<ActivityRecord?> getById(int id);
  Future<int> update(ActivityRecord record);
  Future<int> delete(int id);
  Future<void> deleteAll();
}

          
================================================
📄 ARCHIVO: lib\features\history\presentation\bloc\history_bloc.dart
================================================

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/activity_record.dart';
import '../../domain/repositories/activity_repository.dart';

// ═══════════════════════════════════════════════════════════════
// EVENTOS
// ═══════════════════════════════════════════════════════════════

abstract class HistoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HistoryLoadRequested extends HistoryEvent {}

class HistoryRecordAdded extends HistoryEvent {
  final ActivityRecord record;
  HistoryRecordAdded(this.record);
  @override
  List<Object?> get props => [record];
}

class HistoryRecordUpdated extends HistoryEvent {
  final ActivityRecord record;
  HistoryRecordUpdated(this.record);
  @override
  List<Object?> get props => [record];
}

class HistoryRecordDeleted extends HistoryEvent {
  final int id;
  HistoryRecordDeleted(this.id);
  @override
  List<Object?> get props => [id];
}

class HistoryAllDeleted extends HistoryEvent {}

// ═══════════════════════════════════════════════════════════════
// ESTADOS
// ═══════════════════════════════════════════════════════════════

abstract class HistoryState extends Equatable {
  const HistoryState();
  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

class HistoryLoaded extends HistoryState {
  final List<ActivityRecord> records;
  const HistoryLoaded(this.records);
  @override
  List<Object?> get props => [records];
}

class HistoryError extends HistoryState {
  final String message;
  const HistoryError(this.message);
  @override
  List<Object?> get props => [message];
}

// ═══════════════════════════════════════════════════════════════
// BLOC
// ═══════════════════════════════════════════════════════════════

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ActivityRepository _repository;

  HistoryBloc(this._repository) : super(const HistoryInitial()) {
    on<HistoryLoadRequested>(_onLoad);
    on<HistoryRecordAdded>(_onAdd);
    on<HistoryRecordUpdated>(_onUpdate);
    on<HistoryRecordDeleted>(_onDelete);
    on<HistoryAllDeleted>(_onDeleteAll);
  }

  Future<void> _onLoad(
    HistoryLoadRequested event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryLoading());
    try {
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onAdd(
    HistoryRecordAdded event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.insert(event.record);
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onUpdate(
    HistoryRecordUpdated event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.update(event.record);
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onDelete(
    HistoryRecordDeleted event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.delete(event.id);
      final records = await _repository.getAll();
      emit(HistoryLoaded(records));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  Future<void> _onDeleteAll(
    HistoryAllDeleted event,
    Emitter<HistoryState> emit,
  ) async {
    try {
      await _repository.deleteAll();
      emit(const HistoryLoaded([]));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}

          
================================================
📄 ARCHIVO: lib\features\history\presentation\pages\history_page.dart
================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/history_bloc.dart';
import '../../domain/entities/activity_record.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(HistoryLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Actividad'),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'Borrar todo',
            onPressed: () => _confirmDeleteAll(context),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Agregar registro',
            onPressed: () => _showRecordDialog(context, null),
          ),
        ],
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HistoryError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(state.message, textAlign: TextAlign.center),
                  TextButton(
                    onPressed: () => context
                        .read<HistoryBloc>()
                        .add(HistoryLoadRequested()),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          if (state is HistoryLoaded) {
            if (state.records.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.history, size: 80, color: Colors.grey[300]),
                    const SizedBox(height: 16),
                    Text(
                      'Sin registros aún',
                      style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Usa el Detector de Actividad para registrar sesiones automáticamente',
                      style: TextStyle(color: Colors.grey[400]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                _buildSummaryCard(state.records),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.records.length,
                    itemBuilder: (context, index) {
                      return _buildRecordCard(context, state.records[index]);
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  // ── Tarjeta de resumen ────────────────────────────────────────────
  Widget _buildSummaryCard(List<ActivityRecord> records) {
    final totalSteps    = records.fold(0,   (sum, r) => sum + r.steps);
    final totalKm       = records.fold(0.0, (sum, r) => sum + r.distanceKm);
    final totalCalories = records.fold(0.0, (sum, r) => sum + r.calories);
    final totalFalls    = records.fold(0,   (sum, r) => sum + r.fallCount); // ← NUEVO

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _summaryItem(Icons.directions_walk, totalSteps.toString(), 'Pasos'),
          _summaryItem(Icons.straighten,
              '${totalKm.toStringAsFixed(1)} km', 'Distancia'),
          _summaryItem(Icons.local_fire_department,
              totalCalories.toStringAsFixed(0), 'Calorías'),
          _summaryItem(Icons.event_note, records.length.toString(), 'Sesiones'),
          // ← NUEVO: total de caídas en todas las sesiones
          _summaryItem(
            Icons.warning_amber_rounded,
            totalFalls.toString(),
            'Caídas',
            color: totalFalls > 0 ? Colors.orange.shade200 : Colors.white70,
          ),
        ],
      ),
    );
  }

  Widget _summaryItem(IconData icon, String value, String label,
      {Color? color}) {
    final c = color ?? Colors.white70;
    return Column(
      children: [
        Icon(icon, color: c, size: 20),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                color: color != null ? color : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 11)),
      ],
    );
  }

  // ── Tarjeta de cada registro ──────────────────────────────────────
  Widget _buildRecordCard(BuildContext context, ActivityRecord record) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF6366F1).withValues(alpha: 0.1),
          child: Icon(
            _activityIcon(record.activityType),
            color: const Color(0xFF6366F1),
          ),
        ),
        title: Text(
          record.activityLabel,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${record.steps} pasos · '
              '${record.distanceKm.toStringAsFixed(2)} km · '
              '${record.calories.toStringAsFixed(0)} cal',
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              '⏱ ${record.formattedDuration} · '
              '${_formatDate(record.startedAt)}',
              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            ),
            // ← NUEVO: badge de caídas, solo si hubo al menos una
            if (record.fallCount > 0) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        size: 13, color: Colors.orange.shade700),
                    const SizedBox(width: 4),
                    Text(
                      '${record.fallCount} caída${record.fallCount > 1 ? 's' : ''} '
                      'detectada${record.fallCount > 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (record.notes != null && record.notes!.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text(
                '📝 ${record.notes}',
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') _showRecordDialog(context, record);
            if (value == 'delete') _confirmDelete(context, record);
          },
          itemBuilder: (_) => [
            const PopupMenuItem(value: 'edit',   child: Text('Editar')),
            const PopupMenuItem(value: 'delete', child: Text('Eliminar')),
          ],
        ),
      ),
    );
  }

  // ── Diálogo de Crear / Editar ─────────────────────────────────────
  void _showRecordDialog(BuildContext context, ActivityRecord? existing) {
    final isEditing = existing != null;

    String selectedType = existing?.activityType ?? 'walking';
    final stepsCtrl     = TextEditingController(
        text: existing?.steps.toString() ?? '0');
    final distanceCtrl  = TextEditingController(
        text: existing?.distanceKm.toStringAsFixed(2) ?? '0');
    final caloriesCtrl  = TextEditingController(
        text: existing?.calories.toStringAsFixed(0) ?? '0');
    final durationCtrl  = TextEditingController(
        text: existing?.duration.inMinutes.toString() ?? '0');
    final notesCtrl     = TextEditingController(text: existing?.notes ?? '');

    showDialog<void>(
      context: context,
      builder: (dialogCtx) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title: Text(isEditing ? 'Editar Registro' : 'Nuevo Registro'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: selectedType,
                      decoration: const InputDecoration(
                        labelText: 'Tipo de actividad',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'walking', child: Text('Caminata')),
                        DropdownMenuItem(
                            value: 'running', child: Text('Carrera')),
                        DropdownMenuItem(
                            value: 'stationary',
                            child: Text('Ejercicio estático')),
                      ],
                      onChanged: (v) =>
                          setDialogState(() => selectedType = v!),
                    ),
                    const SizedBox(height: 12),
                    _dialogField(stepsCtrl, 'Pasos',
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 12),
                    _dialogField(distanceCtrl, 'Distancia (km)',
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true)),
                    const SizedBox(height: 12),
                    _dialogField(caloriesCtrl, 'Calorías',
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true)),
                    const SizedBox(height: 12),
                    _dialogField(durationCtrl, 'Duración (minutos)',
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 12),
                    _dialogField(notesCtrl, 'Notas (opcional)',
                        maxLines: 2),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogCtx),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    final record = ActivityRecord(
                      id: existing?.id,
                      activityType: selectedType,
                      steps: int.tryParse(stepsCtrl.text) ?? 0,
                      distanceKm: double.tryParse(distanceCtrl.text) ?? 0,
                      calories: double.tryParse(caloriesCtrl.text) ?? 0,
                      duration: Duration(
                          minutes: int.tryParse(durationCtrl.text) ?? 0),
                      startedAt: existing?.startedAt ?? DateTime.now(),
                      endedAt: existing?.endedAt,
                      notes: notesCtrl.text.isEmpty ? null : notesCtrl.text,
                      // Al editar manualmente se conservan las caídas originales
                      fallCount: existing?.fallCount ?? 0,
                    );

                    if (isEditing) {
                      context
                          .read<HistoryBloc>()
                          .add(HistoryRecordUpdated(record));
                    } else {
                      context
                          .read<HistoryBloc>()
                          .add(HistoryRecordAdded(record));
                    }

                    Navigator.pop(dialogCtx);
                  },
                  child: Text(isEditing ? 'Guardar' : 'Agregar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _dialogField(
    TextEditingController ctrl,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: ctrl,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
    );
  }

  // ── Confirmación de eliminación ───────────────────────────────────
  void _confirmDelete(BuildContext context, ActivityRecord record) {
    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Eliminar registro'),
        content: Text(
            '¿Eliminar la sesión del ${_formatDate(record.startedAt)}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              context
                  .read<HistoryBloc>()
                  .add(HistoryRecordDeleted(record.id!));
              Navigator.pop(dialogCtx);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAll(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Borrar todo el historial'),
        content:
            const Text('¿Estás seguro? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              context.read<HistoryBloc>().add(HistoryAllDeleted());
              Navigator.pop(dialogCtx);
            },
            child: const Text('Borrar todo'),
          ),
        ],
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────
  IconData _activityIcon(String type) {
    switch (type) {
      case 'walking': return Icons.directions_walk;
      case 'running': return Icons.directions_run;
      default:        return Icons.accessibility_new;
    }
  }

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/'
        '${dt.month.toString().padLeft(2, '0')}/'
        '${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }
}

          
================================================
📄 ARCHIVO: lib\injection_container.dart
================================================

import 'package:get_it/get_it.dart';
import 'features/activity/data/datasources/activity_datasource_impl.dart';
import 'features/activity/data/services/tts_service.dart';
import 'features/activity/presentation/bloc/activity_bloc.dart';
import 'features/auth/data/datasources/accelerometer_datasource.dart';
import 'features/auth/tracking/data/datasources/gps_datasource.dart';
import 'features/history/data/repositories/activity_repository_impl.dart';
import 'features/history/domain/repositories/activity_repository.dart';
import 'features/history/presentation/bloc/history_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {
  // ── Servicios ────────────────────────────────────────────────────
  sl.registerLazySingleton<TtsService>(() => TtsService());

  // ── Datasources ──────────────────────────────────────────────────
  sl.registerLazySingleton<AccelerometerDataSource>(
    () => AccelerometerDataSourceImpl(),
  );
  sl.registerLazySingleton<GpsDataSource>(
    () => GpsDataSourceImpl(),
  );
  sl.registerLazySingleton<ActivityDataSourceImpl>(
    () => ActivityDataSourceImpl(sl<AccelerometerDataSource>()),
  );

  // ── Repositorio CRUD ─────────────────────────────────────────────
  sl.registerLazySingleton<ActivityRepository>(
    () => ActivityRepositoryImpl(),
  );

  // ── BLoCs ────────────────────────────────────────────────────────
  sl.registerFactory<ActivityBloc>(
    () => ActivityBloc(
      dataSource: sl<ActivityDataSourceImpl>(),
      ttsService: sl<TtsService>(),
      repository: sl<ActivityRepository>(), // ← línea añadida
    ),
  );

  sl.registerFactory<HistoryBloc>(
    () => HistoryBloc(sl<ActivityRepository>()),
  );
}

          
================================================
📄 ARCHIVO: lib\main.dart
================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';

import 'features/auth/data/datasources/biometric_datasource.dart';
import 'features/auth/domain/usecases/authenticate_user.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/steps/presentation/widgets/step_counter_widget.dart';
import 'features/auth/tracking/presentation/widgets/route_map_widget.dart';
import 'features/activity/presentation/bloc/activity_bloc.dart';
import 'features/activity/presentation/pages/activity_page.dart';
import 'features/history/presentation/bloc/history_bloc.dart';
import 'features/history/presentation/pages/history_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    final biometricDataSource = BiometricDataSourceImpl();
    final authenticateUser    = AuthenticateUser(biometricDataSource);

    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => AuthBloc(authenticateUser),
        child: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isAuthenticated = false;

  void _onAuthSuccess() => setState(() => _isAuthenticated = true);

  @override
  Widget build(BuildContext context) {
    if (_isAuthenticated) return const HomePage();
    return LoginPage(onAuthSuccess: _onAuthSuccess);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTabChanged(BuildContext innerContext, int index) {
    setState(() => _currentIndex = index);
    // Al entrar al historial, recargar siempre desde la BD
    if (index == 2) {
      innerContext.read<HistoryBloc>().add(HistoryLoadRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ActivityBloc>()),
        BlocProvider(
          create: (_) => sl<HistoryBloc>()..add(HistoryLoadRequested()),
        ),
      ],
      child: Builder(
        builder: (innerContext) {
          return BlocListener<ActivityBloc, ActivityBlocState>(
            // ── CLAVE: cuando se guarda una sesión automáticamente,
            // notificar al HistoryBloc para que recargue la lista.
            listener: (context, state) {
              if (state is ActivitySessionSaved) {
                innerContext
                    .read<HistoryBloc>()
                    .add(HistoryLoadRequested());
              }
            },
            child: Scaffold(
              body: IndexedStack(
                index: _currentIndex,
                children: const [
                  _HomeTab(),
                  ActivityPage(),
                  HistoryPage(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) => _onTabChanged(innerContext, index),
                selectedItemColor: const Color(0xFF6366F1),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Inicio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.accessibility_new),
                    label: 'Detector',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'Historial',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Tracker'),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            StepCounterWidget(),
            SizedBox(height: 16),
            RouteMapWidget(),
          ],
        ),
      ),
    );
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

  # ── PLUGINS (reemplazan Platform Channels) ──────────────────
  # Autenticación biométrica (reemplaza MethodChannel biométrico)
  local_auth: ^2.1.8

  # GPS y ubicación (reemplaza EventChannel/MethodChannel GPS)
  geolocator: ^11.0.0

  # Acelerómetro y sensores (ya estaba, ahora es la fuente directa)
  sensors_plus: ^5.0.1

  # Clasificación de actividad (caminar / correr / quieto)
  activity_recognition_flutter: ^6.0.0

  # Síntesis de voz
  flutter_tts: ^4.0.2

  # Persistencia local para CRUD historial
  sqflite: ^2.3.0
  path: ^1.8.3

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


