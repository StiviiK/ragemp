#!/bin/sh
set -e
BRIDGE_URL=https://cdn.rage.mp/lin/bridge-linux-037.tar.gz
DOTNET_CORE_RUNTIME_URL=https://download.visualstudio.microsoft.com/download/pr/fa0cd01b-c71c-40ed-bb78-1ff9acbfb8b2/e6510b76b6272bc7ce3f85e3a96ff9e1/dotnet-runtime-3.0.0-preview6-27804-01-linux-x64.tar.gz

if [ ! -e bridge/settings.xml ]; then
	echo "Downloading bridge default files..."
	mkdir tmp
	mkdir bridge
	curl $BRIDGE_URL -o tmp/bridge.tar.gz
	tar -xzf tmp/bridge.tar.gz -C tmp/
	mv tmp/bridge/* bridge/
	rm -rf tmp/bridge
	echo "Done."

    echo "Updating bridge runtime to 3.0..."
    mkdir tmp/core
    curl $DOTNET_CORE_RUNTIME_URL -o tmp/core.tar.gz
    tar -xzf tmp/core.tar.gz -C tmp/core/
    ls -la -R tmp/core
    mv tmp/core/shared/Microsoft.NETCore.App/3.0.0-preview6-27804-01/* bridge/runtime/
    rm -rf tmp
    echo "Done."
fi

exec ./server
