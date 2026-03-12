# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# WebView
-keep class io.flutter.plugins.webviewflutter.** { *; }
-keep class android.webkit.** { *; }
-dontwarn io.flutter.plugins.webviewflutter.**

# Play Core (deferred components)
-dontwarn com.google.android.play.core.**

# Gson / JSON
-keep class com.google.gson.** { *; }
-keepattributes Signature
-keepattributes *Annotation*

# HTTP
-dontwarn org.apache.http.**
-dontwarn android.net.http.**

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}
