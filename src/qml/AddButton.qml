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
    DropShadow {
          anchors.fill: bckg
          horizontalOffset: 8
          verticalOffset: 8
          radius: 15
          transparentBorder: true
          samples: 9
          source: bckg
          color: "black"
          opacity: 0.25
          z: -1
        }

    text: "+"
    onPressed: {
        bckg.color = "#7338aa"
    }
    onPressedChanged: {
        bckg.color = "#612f8f"
    }
}
