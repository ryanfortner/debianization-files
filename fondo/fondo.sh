#!/bin/bash

version=1.6.1

rm -rf *.tar.gz

rm -rf fondo-*/

wget https://github.com/calo001/fondo/archive/refs/tags/${version}.tar.gz -O fondo-${version}.tar.gz

tar -xvf fondo-${version}.tar.gz

cp -r debian fondo-${version}/

cd fondo-${version}

sudo mk-build-deps -i debian/control

dpkg-buildpackage -us -uc -nc

cd ../