-keep class io.flutter.plugins.webviewflutter.** { *; }
-keep class android.webkit.** { *; }
-dontwarn io.flutter.plugins.webviewflutter.**

# Keep Flutter engine
-keep class io.flutter.** { *; }
-keep class io.flutter.embedding.** { *; }

# Keep url_launcher
-keep class io.flutter.plugins.urllauncher.** { *; }

# Keep shared_preferences
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# Prevent R8 from crashing on Samsung/Oppo devices
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
