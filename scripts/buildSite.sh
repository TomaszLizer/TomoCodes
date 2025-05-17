
#!/bin/zsh
appName="TomoCodes"
configuration="debug"
derivedDataPath=".build/derivedData"
    
# Build Swift Code
xcodebuild \
    -configuration $configuration \
    -scheme "$appName" \
    -sdk macosx \
    -destination 'platform=macOS' \
    -derivedDataPath "$derivedDataPath"
   
# Run Site generation
$derivedDataPath/Build/Products/$configuration/$appName