#!/bin/bash

version=2.6.6

rm -rf *.tar.gz

rm -rf keepassxc-*/

wget https://github.com/keepassxreboot/keepassxc/archive/refs/tags/${version}.tar.gz -O keepassxc-${version}.tar.gz

tar -xvf keepassxc-${version}.tar.gz

cp -r debian keepassxc-${version}/

cd keepassxc-${version}

sudo mk-build-deps \
    --tool \
    'apt-cudf-get --solver aspcud -o APT::Get::Assume-Yes=1 -o Debug::pkgProblemResolver=0 -o APT::Install-Recommends=0' \
    -i debian/control

dpkg-buildpackage -us -uc -nc

cd ../