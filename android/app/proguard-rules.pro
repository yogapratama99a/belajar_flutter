# Proguard rules for Flutter
-keep class com.google.vending.licensing.ILicensingService { *; }
-keep class com.android.vending.licensing.ILicensingService { *; }
-keep class com.google.android.vending.licensing.ILicensingService { *; }

# Keep annotations
-keep class android.support.annotation.Keep { *; }

# Keep Flutter related classes
-keep class io.flutter.** { *; }
-keep class com.google.android.play.** { *; }
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-dontwarn com.google.android.play.**
-dontwarn io.flutter.embedding.engine.deferredcomponents.**