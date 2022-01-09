import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

RoundButton {
    id: addButton
    width: 60
    height: 60
    opacity: (enabled) ? 1.0 : 0.3
    background: Rectangle {
        id: bckg
        radius: parent.radius
         color: "#9a9a9a"
        smooth: true
        antialiasing: true
        visible: false
    }
    Colorize {
        anchors.fill: parent
        source: bckg
        hue: ThemeInfo.hueValue
        saturation: 0.7
        lightness: ThemeInfo.backgroundLightness-ThemeInfo.elementSubtractor
        opacity: 0.75
    }

    text: "+"
    font.pointSize: 20
    onPressed: {
        bckg.color = "#7338aa"
    }
    onPressedChanged: {
        bckg.color = "#612f8f"
    }
}
