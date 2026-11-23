#!/bin/bash
# Builds an installer package (build/Thrust-1.0.pkg) that installs Thrust.app into /Applications.
set -euo pipefail
cd "$(dirname "$0")"
./build_app.sh
VERSION=1.0
STAGE=build/pkgroot
rm -rf "$STAGE" build/component.pkg
mkdir -p "$STAGE"
cp -R build/Thrust.app "$STAGE/"
# keep the app where we put it (don't let the installer relocate it to another copy found on disk)
pkgbuild --analyze --root "$STAGE" build/components.plist >/dev/null
plutil -replace 0.BundleIsRelocatable -bool NO build/components.plist
pkgbuild --root "$STAGE" --component-plist build/components.plist \
         --identifier se.nehr.thrust --version "$VERSION" \
         --install-location /Applications build/component.pkg
cat > build/distribution.xml <<XML
<?xml version="1.0" encoding="utf-8"?>
<installer-gui-script minSpecVersion="2">
    <title>Thrust</title>
    <options customize="never" require-scripts="false" hostArchitectures="arm64,x86_64"/>
    <volume-check><allowed-os-versions><os-version min="13.0"/></allowed-os-versions></volume-check>
    <choices-outline><line choice="default"><line choice="se.nehr.thrust"/></line></choices-outline>
    <choice id="default"/>
    <choice id="se.nehr.thrust" visible="false"><pkg-ref id="se.nehr.thrust"/></choice>
    <pkg-ref id="se.nehr.thrust" version="$VERSION" onConclusion="none">component.pkg</pkg-ref>
</installer-gui-script>
XML
productbuild --distribution build/distribution.xml --package-path build "build/Thrust-$VERSION.pkg"
rm -rf "$STAGE" build/component.pkg build/components.plist build/distribution.xml
echo "Built build/Thrust-$VERSION.pkg"
