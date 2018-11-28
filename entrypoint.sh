#!/bin/bash
set -e

if [ ! -e bridge/settings.xml ]; then
	echo "Downloading bridge default files..."

	mkdir tmp
	mkdir bridge
	curl http://cdn.gtanet.work/bridge-package-linux.tar.gz -o tmp/bridge.tar.gz
	tar -xzf tmp/bridge.tar.gz -C tmp/
	mv tmp/bridge/* bridge/
	mv tmp/conf.json .
	rm -rf tmp

	echo "Done."
fi

exec ./server
