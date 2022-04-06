#!/bin/bash

version=2.7.0

rm -rf *.tar.gz

rm -rf keepassxc-*/

wget https://github.com/keepassxreboot/keepassxc/archive/refs/tags/${version}.tar.gz -O keepassxc-${version}.tar.gz

tar -xvf keepassxc-${version}.tar.gz

cp -r debian keepassxc-${version}/

cd keepassxc-${version}

sudo mk-build-deps -i debian/control

dpkg-buildpackage -us -uc -nc

cd ../