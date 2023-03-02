#!/bin/bash
export runner_workspace="/Users/haduong/gitLab"
export local_homebrew="/opt/homebrew/"
export qt_dir="${local_homebrew}/opt/qt@5"
export QT_FRAMEWORK_PATH=${qt_dir}/lib
export QT_BIN_PATH=${qt_dir}/bin
export CERTIFICATE="Developer ID Application: Nunchuk Inc (9568FP2WHH)"
export FRAMEWORKS="QtConcurrent QtSql QtOpenGL QtMultimediaWidgets QtMultimedia QtVirtualKeyboard QtQuickTemplates2 QtSvg QtWidgets QtDBus QtQuickControls2 QtQuick QtGui QtQmlModels QtQml QtNetwork QtCore QtPdf QtPrintSupport"
export BAD_FRAMEWORKS="QtPrintSupport"
export BUNDLE_NAME="Nunchuk.app"