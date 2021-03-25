FROM debian:latest

ENV MAKE_JOBS 8

ENV BINUTILS_VERSION 2.35
ENV GCC_VERSION 10.1.0

# packages needed to build the cross compiler
RUN apt update || true && apt --yes --force-yes install \
    build-essential \
    bison \
    flex \
    libgmp3-dev \
    libmpc-dev \
    libmpfr-dev \
    texinfo \
    wget

COPY scripts /scripts
ENV PATH="$PATH:/scripts"

# Change this to fit any arch
ENV PREFIX /usr/local/cross
RUN mkdir -p ${PREFIX}
ENV TARGET i686-elf
ENV PATH="${PREFIX}/bin:$PATH"

RUN mkdir /src
RUN download_toolchain.sh /src \
	&& build_binutils.sh /src \
	&& build_gcc.sh /src \
	&& rm -rf /src && rm -rf /scripts
