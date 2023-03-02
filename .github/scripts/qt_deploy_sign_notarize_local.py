import os 
def qt_deploy_sign_notarize(app_name: str, developer_ID: str,keychain_password: str, apple_username: str,apple_password: str, bundle_ID: str) -> bool:
    print("Info: " + app_name)
    print("Info: " + developer_ID)
    print("Info: " + keychain_password)
    print("Info: " + apple_username)
    print("Info: " + apple_password)
    print("Info: " + bundle_ID)
    cwd = os.getcwd() 
    print(cwd)
    workspace="/Users/haduong/gitLab"
    # Unlock keychain, incase it is locked. Needed for signing.
    os.system(f"security unlock-keychain -p {keychain_password} login.keychain")

    # Use macdeployqt to deploy or shared libs and dependencies into the app bundle
    os.system(f"/opt/homebrew/opt/qt@5/bin/macdeployqt {app_name}.app -qmldir=${workspace}/nunchuk-qt -always-overwrite")

    # Sign the app bundle using codesign
    os.system(f"codesign -f --deep -v --options runtime -s 'Developer ID Application: {developer_ID}' {app_name}.app")

qt_deploy_sign_notarize("Nunchuk",
                        "Nunchuk Inc (9568FP2WHH)",
                        "ha0981526891",
                        "dd",
                        "dds",
                        "id")