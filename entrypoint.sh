#!/bin/bash
set -e
BASE_DIR=${1}
cd $BASE_DIR

if [ ! -e $BASE_DIR/bridge/settings.xml ]; then
	echo "Downloading bridge default files..."

	mkdir tmp
	mkdir bridge
	wget -q -O tmp/bridge.tar.gz http://cdn.gtanet.work/bridge-package-linux.tar.gz
	tar -xzf tmp/bridge.tar.gz -C tmp/
	mv tmp/bridge/* bridge/
	mv tmp/conf.json .
	rm -rf tmp

	echo "Done."
fi

exec ./server
