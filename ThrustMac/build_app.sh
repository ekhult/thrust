#!/bin/bash
# Builds Thrust.app (release) into ./build
set -euo pipefail
cd "$(dirname "$0")"
swift build -c release --arch arm64 --arch x86_64
BIN=$(swift build -c release --arch arm64 --arch x86_64 --show-bin-path)
APP=build/Thrust.app
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
cp "$BIN/Thrust" "$APP/Contents/MacOS/Thrust"
cp -R "$BIN/Thrust_Thrust.bundle" "$APP/Contents/Resources/" 
[ -f AppIcon.icns ] && cp AppIcon.icns "$APP/Contents/Resources/"
cat > "$APP/Contents/Info.plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleName</key><string>Thrust</string>
  <key>CFBundleDisplayName</key><string>Thrust</string>
  <key>CFBundleIdentifier</key><string>se.nehr.thrust</string>
  <key>CFBundleVersion</key><string>1.0</string>
  <key>CFBundleShortVersionString</key><string>1.0</string>
  <key>CFBundleExecutable</key><string>Thrust</string>
  <key>CFBundlePackageType</key><string>APPL</string>
  <key>CFBundleIconFile</key><string>AppIcon</string>
  <key>LSMinimumSystemVersion</key><string>13.0</string>
  <key>NSHighResolutionCapable</key><true/>
  <key>LSApplicationCategoryType</key><string>public.app-category.arcade-games</string>
</dict>
</plist>
PLIST
codesign --force --deep -s - "$APP" >/dev/null 2>&1 || true
echo "Built $APP"
