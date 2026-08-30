# Building APK from Barson G Chess - Complete Guide

## Project Overview
This is a professional **Native Android Chess Application** built with:
- **Kotlin + Jetpack Compose** (Modern UI framework)
- **Android API 24+** (Min SDK)
- **Gradle build system**
- **Firebase & Gemini AI integration** (optional)

---

## Prerequisites

### 1. Install Required Tools
- **Android Studio** (Latest version) - [Download](https://developer.android.com/studio)
- **Java 11+** (JDK) - Usually bundled with Android Studio
- **Git** (optional, for version control)

### 2. System Requirements
- **RAM**: 8GB minimum (16GB recommended)
- **Disk Space**: 20GB+ for Android SDK
- **OS**: Windows, macOS, or Linux

---

## Step-by-Step Build Process

### Method 1: Using Android Studio (Recommended for Beginners)

#### 1. **Open the Project**
```bash
1. Launch Android Studio
2. File → Open → Select the project folder (barson-g-chess)
3. Wait for Gradle sync to complete (first time takes 5-10 minutes)
4. Accept any SDK installation prompts
```

#### 2. **Configure Environment**
```bash
# Create .env file in project root
nano .env

# Add your API key (if using Gemini AI):
GEMINI_API_KEY=your_actual_api_key_here

# Save and close
```

#### 3. **Build the APK**
```
Android Studio Menu:
→ Build
  → Build Bundle(s) / APK(s)
    → Build APK(s)
```

**Wait for completion** (~2-5 minutes depending on system)

#### 4. **Find Your APK**
```
Generated APK location:
app/build/outputs/apk/debug/app-debug.apk
```

---

### Method 2: Using Command Line (Advanced)

#### 1. **Clone/Extract Project**
```bash
# Navigate to project directory
cd barson-g-chess

# Verify gradle wrapper exists
ls -la gradlew  # (macOS/Linux)
dir gradlew.bat  # (Windows)
```

#### 2. **Build Debug APK**
```bash
# macOS/Linux
./gradlew assembleDebug

# Windows
gradlew.bat assembleDebug
```

#### 3. **Build Release APK** (For Play Store)
```bash
# First, create signing key if you don't have one
./gradlew signingReport

# Then build release
./gradlew assembleRelease
```

**APK Output:**
```
Debug: app/build/outputs/apk/debug/app-debug.apk
Release: app/build/outputs/apk/release/app-release.apk
```

---

## Testing the APK

### On Emulator
```bash
# Android Studio → Device Manager → Create Virtual Device
# Then:
./gradlew installDebug
```

### On Physical Device
```bash
1. Enable Developer Mode on your phone (Settings → About → Build #7 taps)
2. Enable USB Debugging (Developer Options)
3. Connect via USB
4. Run: ./gradlew installDebug
```

### Manual Installation
```bash
# Using adb (Android Debug Bridge)
adb install app/build/outputs/apk/debug/app-debug.apk

# Or double-click the APK file on your device
```

---

## Build Configuration Details

### Key Files
| File | Purpose |
|------|---------|
| `build.gradle.kts` | Main build configuration |
| `.env` | API keys and secrets |
| `settings.gradle.kts` | Project settings |
| `gradle.properties` | Gradle system properties |

### Build Variants
```
Debug APK   → Development & testing (faster build)
Release APK → Production & Play Store (optimized, signed)
```

---

## Troubleshooting

### Issue: "Gradle sync failed"
```bash
# Solution:
1. File → Invalidate Caches → Restart
2. Update build.gradle.kts Android Gradle Plugin version
3. ./gradlew clean
```

### Issue: "SDK not found"
```bash
# Solution:
1. File → Project Structure → SDK Location
2. Point to your Android SDK directory
3. If missing, download via SDK Manager (Tools → SDK Manager)
```

### Issue: "API Key errors"
```bash
# Solution:
1. Verify .env file exists in project root
2. Check GEMINI_API_KEY format is correct
3. Uncomment the key line in .env.example
```

### Issue: "Out of Memory"
```bash
# Edit gradle.properties:
org.gradle.jvmargs=-Xmx4g -XX:MaxPermSize=2g

# Or increase in Android Studio:
File → Settings → Build, Execution, Deployment → Gradle
```

---

## Release Build (For Google Play)

### 1. **Create Signing Key**
```bash
# Android Studio → Build → Generate Signed Bundle/APK
# Follow wizard to create keystore file
# ⚠️ SAVE THE KEYSTORE FILE - You'll need it for future updates!
```

### 2. **Sign the APK**
```bash
# Command line method:
jarsigner -verbose -sigalg SHA1withRSA \
  -digestalg SHA1 \
  -keystore my-release-key.keystore \
  app-release-unsigned.apk \
  alias_name
```

### 3. **Align the APK**
```bash
zipalign -v 4 app-release-unsigned.apk app-release.apk
```

### 4. **Upload to Play Store**
```
Google Play Console → Your App → Release → Production
→ Upload app-release.apk
```

---

## Project Structure

```
barson-g-chess/
├── app/
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/example/   (Source code)
│   │   │   ├── res/                (Resources: layouts, drawable, values)
│   │   │   └── AndroidManifest.xml
│   │   ├── test/                   (Unit tests)
│   │   └── androidTest/            (Instrumented tests)
│   ├── build.gradle.kts            (App-level build config)
│   └── proguard-rules.pro          (Code obfuscation rules)
├── build.gradle.kts                (Project-level config)
├── settings.gradle.kts
├── gradle.properties
├── .env                            (Your API keys)
└── README.md
```

---

## Key Features of This Chess App

✅ **Professional Staunton Pieces** - Luxury tournament-grade graphics
✅ **Non-scrolling 8×8 Board** - Full view, no panning needed
✅ **AI Engine** - Multiple difficulty levels (Novice to Grandmaster)
✅ **Chess Clocks** - Blitz, Rapid, and untimed modes
✅ **Puzzle Mode** - Solve 6+ tactical puzzles
✅ **Move History** - Replay all moves
✅ **Sound Effects** - Wood piece knock sounds
✅ **Dark Theme** - Eye-friendly luxury design
✅ **Pass & Play** - 2-player local games

---

## Performance Tips

- **Build faster**: Use `assembleDebug` instead of `assembleRelease` during development
- **Use emulator with VM acceleration**: Enable KVM (Linux) or HAXM (Windows/macOS)
- **Gradle caching**: Enabled by default (`org.gradle.caching=true`)
- **Parallel builds**: `org.gradle.parallel=true` in gradle.properties

---

## Next Steps

1. ✅ Extract the ZIP file
2. ✅ Open in Android Studio
3. ✅ Build Debug APK
4. ✅ Test on emulator or device
5. ✅ (Optional) Create Release APK for Play Store

---

## Support Resources

- [Android Developers](https://developer.android.com/)
- [Kotlin Documentation](https://kotlinlang.org/docs/)
- [Jetpack Compose Guide](https://developer.android.com/jetpack/compose)
- [Firebase Console](https://console.firebase.google.com/)
- [Google Play Console](https://play.google.com/console/)

---

**Build Status**: Ready to build ✨
**Target API**: 36 (Android 15)
**Min API**: 24 (Android 7.0)
**Gradle Version**: 9.3.1
**Kotlin Version**: 2.2.10
