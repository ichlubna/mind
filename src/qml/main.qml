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

    header: null
    AppToolBar{
        id: toolBar
        z: 999}

    SettingsDrawer{
        id: drawer
    }

    StackView {
        id: stackView
        initialItem: "Home.qml"
        anchors.fill: parent
    }

    FastBlur
    {
       id: bckgBlur
       visible: true
       anchors.fill: stackView
       source: stackView
       radius: 0
    }

    FastBlur
    {
       id: toolBarBlur
       visible: true
       anchors.fill: toolBar
       source: toolBar
       radius: 0
       opacity: 1.0
       z: 9999
    }

    PropertyAnimation { id: showBckgBlur;
                            target: bckgBlur;
                            property: "radius";
                            to: 30;
                            duration: 250 }

    PropertyAnimation { id: hideBckgBlur;
                            target: bckgBlur;
                            property: "radius";
                            to: 0;
                            duration: 250 }
    PropertyAnimation { id: showToolBarBlur;
                            target: toolBarBlur;
                            property: "radius";
                            to: 30;
                            duration: 250 }

    PropertyAnimation { id: hideToolBarBlur;
                            target: toolBarBlur;
                            property: "radius";
                            to: 0;
                            duration: 250 }

    function showBlur()
    {
        showBckgBlur.start();
        showToolBarBlur.start();
    }

    function hideBlur()
    {
        hideBckgBlur.start();
        hideToolBarBlur.start();
    }
}
