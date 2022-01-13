#!/bin/bash

version=1.6.1

rm -rf *.tar.gz

rm -rf fondo-*/

wget https://github.com/calo001/fondo/archive/refs/tags/${version}.tar.gz -O fondo-${version}.tar.gz

tar -xvf fondo-${version}.tar.gz

cp debian fondo-${version}/

cd fondo-${version}

sudo mk-build-deps \
    --tool \
    'apt-cudf-get --solver aspcud -o APT::Get::Assume-Yes=1 -o Debug::pkgProblemResolver=0 -o APT::Install-Recommends=0' \
    -i debian/control

dpkg-buildpackage -us -uc -nc

cd ../