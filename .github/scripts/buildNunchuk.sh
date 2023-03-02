#!/bin/bash
export script_path="/Users/haduong/gitLab/macdeploynunchuk/.github/scripts"
source ${script_path}/color.sh
source ${script_path}/current_path.sh
echo -e "${Light_Purple}Install environment ${Normal}: Let type chose 1): "
echo -e "${Light_Purple}Install qtkeychain ${Normal}: Let type chose 2): "
echo -e "${Light_Purple}Build bitcoin ${Normal}: Let type chose 3): "
echo -e "${Light_Purple}Re-build and First build nunchuck-qt ${Normal}: Let type chose 4): "
echo -e "${Light_Purple}Build nunchuck-qt ${Normal}: Let type chose 5): "
echo -e "${Light_Purple}qt deploy customize ${Normal}: Let type chose 6): "
echo -e "${Light_Purple}qt deploy macdeployqt ${Normal}: Let type chose 7): "
echo -e "${Light_Purple}qt sign script ${Normal}: Let type chose 8): "
echo -e "${Light_Purple}qt sign python3 ${Normal}: Let type chose 9): "
echo -e "${Light_Purple}qt notarytool notarize ${Normal}: Let type chose 10): "
echo -e "${Light_Purple}clear signature ${Normal}: Let type chose a): "
echo -e "${Yellow}Enter the way to build App: ${Normal}"
echo ${runner_workspace}
read index
if [ $index -eq "1" ]
then
    bash ${script_path}/subs/environment_install.sh
elif [ $index -eq "2" ]
then
    bash ${script_path}/subs/qtkeychain_install.sh
elif [ $index -eq "3" ]
then
    bash ${script_path}/subs/build_bitcoin.sh
elif [ $index -eq "4" ]
then
    bash ${script_path}/subs/rebuild_nunchuk.sh
elif [ $index -eq "5" ]
then
    bash ${script_path}/subs/build_nunchuk.sh
elif [ $index -eq "6" ]
then
    bash ${script_path}/subs/deploy_only.sh
elif [ $index -eq "7" ]
then
    cd ${runner_workspace}/build
    python3 ${script_path}/subs/deploy_only.py
elif [ $index -eq "8" ]
then
    # Call itself
    bash ${script_path}/subs/sign_only.sh
elif [ $index -eq "9" ]
then
    cd ${runner_workspace}/build
    python3 ${script_path}/subs/sign_only.py
elif [ $index -eq "10" ]
then
    cd ${runner_workspace}/build
    rm -r Nunchuk.dmg
    python3 ${script_path}/subs/qt_notarytool_notarize.py
else
    echo "To fix error: resource fork, Finder information, or similar detritus not allowed."
    cd ${runner_workspace}/build
    codesign --remove-signature "$BUNDLE_NAME"
    xattr -lr "$BUNDLE_NAME"
    xattr -cr "$BUNDLE_NAME"
fi