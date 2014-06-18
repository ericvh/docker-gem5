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
scons --ignore-style build/ARM/gem5.opt
