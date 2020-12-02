#!/bin/bash

cacheCommit=`cat $TRAVIS_BUILD_DIR/cache/bitcoin.commit`
currentCommit=`git -C contrib/libnunchuk/contrib/bitcoin rev-parse HEAD`

if [ "$cacheCommit" == "$currentCommit" ]; then
  echo "Restore Bitcoin Core cache"
  cp -R $TRAVIS_BUILD_DIR/cache/bitcoin contrib/libnunchuk/contrib
else
  echo "Build Bitcoin Core"
  pushd contrib/libnunchuk/contrib/bitcoin
  source ./autogen.sh
  source ./configure --without-gui --disable-zmq --with-miniupnpc=no --with-incompatible-bdb --disable-bench --disable-tests
  make -j8
  popd
  echo "Update Bitcoin Core cache"
  rm -rf $TRAVIS_BUILD_DIR/cache/bitcoin
  cp -R contrib/libnunchuk/contrib/bitcoin $TRAVIS_BUILD_DIR/cache
  echo $currentCommit > $TRAVIS_BUILD_DIR/cache/bitcoin.commit
fi

