#!/bin/bash

src_dir=${1}

pushd ${src_dir}
mkdir build-gcc
cd build-gcc
../gcc-${GCC_VERSION}/configure \
	--target=$TARGET \
	--prefix="$PREFIX" \
	--disable-nls \
	--enable-languages=c,c++ \
	--without-headers

make -j${MAKE_JOBS} all-gcc
make -j${MAKE_JOBS} all-target-libgcc
make -j${MAKE_JOBS} install-gcc
make -j${MAKE_JOBS} install-target-libgcc

popd
