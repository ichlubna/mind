import QtQuick 2.14
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.12
import io.qt.UserDataProvider 1.0
import io.qt.Translator 1.0
import QtGraphicalEffects 1.0
import "."
import "./Drawer"

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTrId("appName")

    MouseArea {
        id: outFocuser
        anchors.fill: parent
        z: -999
        onClicked: outFocuser.forceActiveFocus();
    }

    UserDataProvider {
        id: dataProvider
    }

    Translator {
        id: translator
    }

    onVisibilityChanged: {
        ThemeInfo.hueValue = dataProvider.loadInput("themeHue")
        ThemeInfo.backgroundLightness = dataProvider.loadInput("themeLight")
    }

    onClosing: {
        if (stackView.depth > 1) {
            close.accepted = false
            stackView.pop()
        } else
            return
    }
    background: Rectangle {
        id: appBckg
        color: "#9a9a9a"
    }
    Colorize {
        anchors.fill: parent
        source: appBckg
        hue: ThemeInfo.hueValue
        saturation: 0.6
        lightness: ThemeInfo.backgroundLightness
    }

    header: AppToolBar{}

    SettingsDrawer{
        id: drawer
    }

    StackView {
        id: stackView
        initialItem: "Home.qml"
        anchors.fill: parent
    }
}
