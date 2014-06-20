#!/bin/bash
# Build and Clean in one step to keep image manageable

scons -j4 --ignore-style build/ARM/gem5.opt
rm -f /usr/local/bin/gem5.opt
mv build/ARM/gem5.opt /usr/local/bin
rm -rf build
mkdir -p build/ARM
ln -s /usr/local/bin/gem5.opt build/ARM/gem5.opt
