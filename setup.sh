#!/bin/bash

CURRENT_DIRECTORY=$(pwd)
cd /tmp

vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager

cd ${CURRENT_DIRECTORY}

git clone https://github.com/unnamedpanel/panel.git code/panel
git clone https://github.com/unnamedpanel/daemon.git code/daemon

mkdir -p .data/certificates

mkcert -install
mkcert pterodactyl.test *.pterodactyl.test

mv *pterodactyl.test*-key.pem .data/certificates/pterodactyl.test-key.pem
mv *pterodactyl.test*.pem .data/certificates/pterodactyl.test.pem

# sudo gem install docker-sync
# docker-sync start
