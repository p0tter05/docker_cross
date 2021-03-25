#!/bin/bash

src_dir=$1

pushd ${src_dir}
mkdir build-binutils
cd build-binutils

../binutils-${BINUTILS_VERSION}/configure \
        --target=$TARGET \
	--prefix="$PREFIX" \
	--with-sysroot \
	--disable-nls \
	--disable-werror

make -j${MAKE_JOBS}
make -j${MAKE_JOBS} install

popd
