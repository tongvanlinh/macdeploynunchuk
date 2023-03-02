#!/bin/bash
# retrieve bundle name from first parameter
# SIGNING FIXED FRAMEWORK
CODESIGN_OPTIONS="--verbose=4 --timestamp=none"

#echo "******* Sign QtWebEngineProcess ***********"
#codesign --force --verify ${CODESIGN_OPTIONS} --sign "$CERTIFICATE" $BUNDLE_NAME/Contents/Frameworks/QtWebEngineCore.framework/Versions/Current/Helpers/QtWebEngineProcess.app
echo "******* Sign Frameworks-subApps ***********"
codesign --force --verify ${CODESIGN_OPTIONS} --sign "$CERTIFICATE" $BUNDLE_NAME/Contents/Frameworks/*.framework/Versions/*/*/*.app

echo "******* Signing Frameworks ***********"
for CURRENT_FRAMEWORK in ${FRAMEWORKS}; do
    echo "Signing framework: ${CURRENT_FRAMEWORK}"
    codesign --force --verify ${CODESIGN_OPTIONS} --sign "$CERTIFICATE" $BUNDLE_NAME/Contents/Frameworks/${CURRENT_FRAMEWORK}.framework
done

# Sign plugins
echo "******* Signing Plugins ***********"
codesign --force --verify ${CODESIGN_OPTIONS} --sign "${CERTIFICATE}" ${BUNDLE_NAME}/Contents/Plugins/*/*.dylib

# Sign Frameworks dylib 
echo "******* Signing Frameworks dylib ***********"
codesign --force --verify ${CODESIGN_OPTIONS} --sign "${CERTIFICATE}" ${BUNDLE_NAME}/Contents/Frameworks/*.dylib

# Sign bundle itself
echo "******* Signing Bundle ***********"
codesign --force --verify ${CODESIGN_OPTIONS} --sign "$CERTIFICATE" $BUNDLE_NAME

# Verify

echo "******* Verify Bundle ***********"
codesign --verify --deep ${CODESIGN_OPTIONS} $BUNDLE_NAME

codesign -dvvv $BUNDLE_NAME

echo "******* Verify Bundle using dpctl ***********"
spctl -a -vvvv $BUNDLE_NAME