#!/bin/bash
echo "Build bitcoin: "${runner_workspace}
cd ${runner_workspace}/nunchuck-qt/contrib/libnunchuk/contrib/bitcoin
export PATH="${qt_dir}/bin:$PATH"
export LDFLAGS="$LDFLAGS -L${qt_dir}/lib -L${local_homebrew}/opt/boost@1.76/lib -L${local_homebrew}/opt/berkeley-db@4/lib"
export CPPFLAGS="$CPPFLAGS -I${qt_dir}/include -I${local_homebrew}/opt/boost@1.76/include -I${local_homebrew}/opt/berkeley-db@4/include"
export CPPFLAGS="$CPPFLAGS -I${local_homebrew}/Cellar/libevent/2.1.12/include"
export BOOST_ROOT="${local_homebrew}/opt/boost@1.76"
./autogen.sh
./configure --enable-module-ecdh --without-gui --disable-zmq --with-miniupnpc=no --with-incompatible-bdb --disable-bench --disable-tests --with-boost-libdir="${local_homebrew}/opt/boost@1.76/lib"
make -j8