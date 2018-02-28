#!/bin/sh
mkdir -p ~/ragemp_srv ~/ragemp_srv/bridge ~/ragemp_srv/client_packages ~/ragemp_srv/packages
cd ~/ragemp_srv
wget http://cdn.gtanet.work/bridge-package-linux.tar.gz
tar -xzf bridge-package-linux.tar.gz
rm -rf bridge-package-linux.tar.gz conf.json plugins/
