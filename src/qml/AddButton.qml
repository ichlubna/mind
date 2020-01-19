import QtQuick 2.9
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

RoundButton {
    id: addButton
    width: 60
    height: 60
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
        opacity: 0.8
    }
    Shadow {
          anchors.fill: bckg
          source: bckg
        }

    text: "+"
    onPressed: {
        bckg.color = "#7338aa"
    }
    onPressedChanged: {
        bckg.color = "#612f8f"
    }
}
