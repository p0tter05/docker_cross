# Docker i686 cross-compiler

This is a Debian-based bare-metal i686 cross-compiler Docker
environment. Should build without any trouble on any machine.

## Build
To build just clone the repo and build the docker image

```bash
$ git clone ....
$ cd docker_cross
$ docker build . -t docker_cross
```

## Example
```bash
docker run -it -v ${host_project_dir}:/project ${image_name}
```

Then, inside the container:

```bash
cd /project
make
```

This is assuming that the makefile has the same $TARGET as the one used to build the cross-compiler
