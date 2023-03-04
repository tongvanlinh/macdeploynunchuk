#!/bin/bash
echo "Build nunchuck-qt: "${runner_workspace}
cd ${runner_workspace}
export PATH="${qt_dir}/bin:$PATH"
export LDFLAGS="$LDFLAGS -L${qt_dir}/lib -L${local_homebrew}/opt/boost@1.76/lib -L${local_homebrew}/opt/berkeley-db@4/lib -L${local_homebrew}/Cellar/sqlcipher/4.5.3/lib"
export CPPFLAGS="$CPPFLAGS -I${qt_dir}/include -I${local_homebrew}/opt/boost@1.76/include -I${local_homebrew}/opt/berkeley-db@4/include -I${local_homebrew}/Cellar/sqlcipher/4.5.3/include"
export CPPFLAGS="$CPPFLAGS -I${local_homebrew}/Cellar/libevent/2.1.12/include"
export BOOST_ROOT="${local_homebrew}/opt/boost@1.76"
cd build
rm -r Nunchuk.app
cmake --build . --config Release -j8
cp /opt/homebrew/bin/hwi nunchuk-qt.app/Contents/MacOS/hwi
mv nunchuk-qt.app/Contents/MacOS/nunchuk-qt nunchuk-qt.app/Contents/MacOS/Nunchuk
mv nunchuk-qt.app Nunchuk.app