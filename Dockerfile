FROM ubuntu
MAINTAINER Eric Van Hensbergen <ericvh@gmail.com>

# get dependencies
RUN apt-get update
RUN apt-get install -y build-essential m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev swig python-dev python mercurial
RUN apt-get clean

# checkout repo with mercurial
WORKDIR /usr/local/src
RUN hg clone http://repo.gem5.org/gem5
# build it
WORKDIR /usr/local/src/gem5
RUN scons --ignore-style build/ARM/gem5.opt
# clean up build directory to save 2GB
RUN mv build/ARM/gem5.opt /usr/local/bin
RUN rm -rf build
# recreate build directory and link /usr/local/bin/gem5.opt to create a bit of confusion
RUN mkdir -p build/ARM
RUN ln -s /usr/local/bin/gem5.opt build/ARM/gem5.opt
