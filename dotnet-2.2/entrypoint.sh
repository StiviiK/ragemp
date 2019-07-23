#!/bin/sh
set -e
BRIDGE_URL=https://cdn.rage.mp/lin/bridge-linux-037.tar.gz
DOTNET_CORE_RUNTIME_URL=https://download.visualstudio.microsoft.com/download/pr/21968111-f65e-48c7-9c35-8b40de4af06c/66b7a2c7b92b54bd3311f4509cc9b9ed/dotnet-runtime-2.2.5-linux-x64.tar.gz

if [ ! -e bridge/settings.xml ]; then
	echo "Downloading bridge default files..."
	mkdir tmp
	mkdir bridge
	curl $BRIDGE_URL -o tmp/bridge.tar.gz
	tar -xzf tmp/bridge.tar.gz -C tmp/
	mv tmp/bridge/* bridge/
	rm -rf tmp/bridge
	echo "Done."

    echo "Updating bridge runtime to 2.2..."
    mkdir tmp/core
    curl $DOTNET_CORE_RUNTIME_URL -o tmp/core.tar.gz
    tar -xzf tmp/core.tar.gz -C tmp/core/
    ls -la -R tmp/core
    mv tmp/core/shared/Microsoft.NETCore.App/2.2.5/* bridge/runtime/
    rm -rf tmp
    echo "Done."
fi

exec ./server
