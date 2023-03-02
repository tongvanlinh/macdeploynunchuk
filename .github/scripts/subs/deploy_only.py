import os

def deploy_only() -> bool:
    runner_workspace = os.environ.get('runner_workspace')
    QT_BIN_PATH = os.environ.get('QT_BIN_PATH')
    BUNDLE_NAME = os.environ.get('BUNDLE_NAME')
    print(runner_workspace)
    os.system(f"cd {runner_workspace}/build; {QT_BIN_PATH}/macdeployqt {BUNDLE_NAME} -qmldir={runner_workspace}/nunchuk-qt")

deploy_only()