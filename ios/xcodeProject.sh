#!/bin/bash

QT_VERSION="5.12.2"
QT_PATH="/Users/username/Qt"

git clone https://github.com/ichlubna/mind.git
cd mind/translation/
$QT_PATH"/"$QT_VERSION"/ios/bin/lrelease" -idbased ../Mind.pro
cd ..
$QT_PATH"/"$QT_VERSION"/ios/bin/qmake" Mind.pro -spec macx-ios-clang CONFIG+=release CONFIG+=iphoneos CONFIG+=device CONFIG+=qtquickcompiler && /usr/bin/make qmake_all
