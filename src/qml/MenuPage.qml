import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Page {
    visible: true
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
    }

    Connections {
        target: parent
        Component.onCompleted: {
            title = title.replace("<br>"," ")
        }
    }
}
