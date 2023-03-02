#!/bin/bash
cd ${runner_workspace}
echo "Install qtkeychain"${runner_workspace}
git clone https://github.com/frankosterfeld/qtkeychain
cd qtkeychain
mkdir build
cd build
cmake .. -DCMAKE_PREFIX_PATH=${qt_dir}/lib/cmake # -DCMAKE_OSX_ARCHITECTURES="x86_64"
cmake --build .
sudo cmake --install . --prefix "/usr/local"
