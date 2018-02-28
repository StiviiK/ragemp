#!/bin/bash
set -e

if [ ! -e /home/rage/bridge/settings.xml ]; then
	echo "Downloading bridge default files..."

	mkdir -p /home/rage/tmp
	mkdir -p /home/rage/bridge
	wget -q -O /home/rage/tmp/bridge.tar.gz http://cdn.gtanet.work/bridge-package-linux.tar.gz
	tar -xzf /home/rage/tmp/bridge.tar.gz -C /home/rage/tmp/
	mv /home/rage/tmp/bridge/* /home/rage/bridge/
	mv /home/rage/tmp/conf.json /home/rage
	rm -rf /home/rage/tmp

	echo "Done."
fi

exec /home/rage/server
