import QtQuick 2.14
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Page {
    visible: true
    topPadding: 40
    background: Image {
        id: bckg
        source: "qrc:/images/background.svg"
        smooth: true
        antialiasing: true
        visible: false
    }
        focusPolicy: Qt.ClickFocus

    Colorize {
        anchors.fill: parent
        source: bckg
        hue: ThemeInfo.hueValue
        saturation: 0.7
        lightness: ThemeInfo.backgroundLightness
        anchors.topMargin: -40
    }

    Connections {
        target: parent
        Component.onCompleted: {
            title = title.replace("<br>"," ")
        }
    }
}
