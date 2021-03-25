#!/bin/bash

where=$1

pushd ${where}

wget https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VERSION}.tar.xz
tar xvf binutils-${BINUTILS_VERSION}.tar.xz

wget https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.xz
tar xvf gcc-${GCC_VERSION}.tar.xz

rm binutils-${BINUTILS_VERSION}.tar.xz
rm gcc-${GCC_VERSION}.tar.xz

popd
