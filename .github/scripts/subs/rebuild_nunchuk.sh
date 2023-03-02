#!/bin/bash
echo "Re-Build nunchuck-qt: "${runner_workspace}
cd ${runner_workspace}
export PATH="${qt_dir}/bin:$PATH"
export LDFLAGS="$LDFLAGS -L${qt_dir}/lib -L${local_homebrew}/opt/boost@1.76/lib -L${local_homebrew}/opt/berkeley-db@4/lib -L${local_homebrew}/Cellar/sqlcipher/4.5.3/lib"
export CPPFLAGS="$CPPFLAGS -I${qt_dir}/include -I${local_homebrew}/opt/boost@1.76/include -I${local_homebrew}/opt/berkeley-db@4/include -I${local_homebrew}/Cellar/sqlcipher/4.5.3/include"
export CPPFLAGS="$CPPFLAGS -I${local_homebrew}/Cellar/libevent/2.1.12/include"
export BOOST_ROOT="${local_homebrew}/opt/boost@1.76"
mkdir ${runner_workspace}/nunchuck-qt/contrib/libnunchuk/contrib/sqlcipher/.libs
cp ${local_homebrew}/Cellar/sqlcipher/4.5.3/lib/libsqlcipher.a ${runner_workspace}/nunchuck-qt/contrib/libnunchuk/contrib/sqlcipher/.libs/libsqlcipher.a
mkdir ${runner_workspace}/build
cd build
cmake ${runner_workspace}/nunchuck-qt -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=${local_homebrew}/opt/openssl -DCMAKE_PREFIX_PATH=${qt_dir}/lib/cmake -DUR__DISABLE_TESTS=ON -DBOOST_ROOT=${local_homebrew}/opt/boost@1.76
cmake --build . --config Release -j8

 #Fix error: embedded ->set(Bitcoin_LIBRARIES 
    #    bitcoin_common
    #    bitcoin_util
    #    bitcoin_server
    #    bitcoin_wallet
    #    bitcoin_consensus
    #    bitcoin_crypto_base
    #    #bitcoin_crypto_shani
    #    #bitcoin_crypto_sse41
    #    #bitcoin_crypto_avx2
    #    secp256k1
    #    leveldb
    #    univalue
    #    memenv
    #    crc32c
    #    #crc32c_sse42
	#crc32c_arm_crc
    #)