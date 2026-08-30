#!/bin/bash

# Barson G Chess - Quick Build Script
# This script automates the APK building process

set -e  # Exit on error

echo "=========================================="
echo "  Barson G Chess - APK Builder"
echo "=========================================="
echo ""

# Check if in correct directory
if [ ! -f "build.gradle.kts" ]; then
    echo "❌ Error: build.gradle.kts not found!"
    echo "   Please run this script from the project root directory"
    exit 1
fi

# Check Java installation
if ! command -v java &> /dev/null; then
    echo "❌ Error: Java is not installed!"
    echo "   Please install JDK 11 or higher"
    exit 1
fi

echo "✅ Environment check passed"
echo ""

# Menu
echo "Choose build type:"
echo "1) Debug APK (for testing)"
echo "2) Release APK (for Play Store)"
echo "3) Clean build (debug)"
echo "4) Clean build (release)"
read -p "Enter choice (1-4): " choice

case $choice in
    1)
        echo ""
        echo "🔨 Building Debug APK..."
        ./gradlew clean assembleDebug
        echo ""
        echo "✅ Debug APK created:"
        echo "   📦 app/build/outputs/apk/debug/app-debug.apk"
        ;;
    2)
        echo ""
        echo "🔨 Building Release APK..."
        ./gradlew clean assembleRelease
        echo ""
        echo "✅ Release APK created:"
        echo "   📦 app/build/outputs/apk/release/app-release.apk"
        echo ""
        echo "⚠️  Note: Sign the APK before uploading to Play Store"
        ;;
    3)
        echo ""
        echo "🧹 Cleaning project..."
        ./gradlew clean
        echo ""
        echo "🔨 Building Debug APK..."
        ./gradlew assembleDebug
        echo ""
        echo "✅ Clean debug build complete:"
        echo "   📦 app/build/outputs/apk/debug/app-debug.apk"
        ;;
    4)
        echo ""
        echo "🧹 Cleaning project..."
        ./gradlew clean
        echo ""
        echo "🔨 Building Release APK..."
        ./gradlew assembleRelease
        echo ""
        echo "✅ Clean release build complete:"
        echo "   📦 app/build/outputs/apk/release/app-release.apk"
        ;;
    *)
        echo "❌ Invalid choice!"
        exit 1
        ;;
esac

echo ""
echo "=========================================="
echo "Build process completed!"
echo "=========================================="
