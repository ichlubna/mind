# This repository is not active anymore.
The project was reimplemented and moved to:
https://github.com/Nepanikar




An official repo for the Don't Panic mobile App.

Use Qt Creator to build the app for Android directly.
https://play.google.com/store/apps/details?id=org.dontpanic

For iOS use the prepared script to export the XCode project (or export it directly from Qt Creator) and build with XCode.
https://apps.apple.com/sk/app/nepanikař/id1459513911

If QT Graphical Effects are missing in the distribution, install like this:
```
git clone git://code.qt.io/qt/qtgraphicaleffects.git
cd qtgraphicaleffects/
git checkout 59ab3e11433a5157aac0f3af7c0d7fe70a373373
cd ..
~/Qt/6.2.1/gcc_64/bin/qmake qtgraphicaleffects
make
cp qml/QtGraphicalEffects ~/Qt/6.2.1/gcc_64/qml/ -r
```
