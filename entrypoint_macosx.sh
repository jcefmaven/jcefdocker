#!/bin/bash
set -e

# Determine architecture
MACHINE_TYPE=`uname -m`
echo "Building for architecture $MACHINE_TYPE"

git clone https://bitbucket.org/chromiumembedded/java-cef.git src

# Enter the JCEF source code directory.
cd src

# Create and enter the `jcef_build` directory.
# The `jcef_build` directory name is required by other JCEF tooling
# and should not be changed.
mkdir jcef_build && cd jcef_build

# Linux: Generate 64-bit Xcode Makefiles.
cmake -G "Xcode" -DPROJECT_ARCH="x86_64" ..
# Build native part using xcbuild.
xcbuild -executor ninja -project jcef.xcodeproj

#Compile JCEF java classes
#Already built by xcbuild

#Generate distribution
chmod +x make_distrib.sh
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    ./make_distrib.sh macosx64
else
    ./make_distrib.sh macosx64
fi


