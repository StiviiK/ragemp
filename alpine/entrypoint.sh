#!/bin/sh
set -e
BRIDGE_URL=https://cdn.rage.mp/lin/bridge-linux-037.tar.gz

if [ ! -e bridge/settings.xml ]; then
	echo "Downloading bridge default files..."

	mkdir tmp
	mkdir bridge
	curl $BRIDGE_URL -o tmp/bridge.tar.gz
	tar -xzf tmp/bridge.tar.gz -C tmp/
	mv tmp/bridge/* bridge/
	rm -rf tmp

	echo "Done."
fi

exec ./server
