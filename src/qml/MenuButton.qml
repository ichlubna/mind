import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Button {
    property var target: ""
    property alias bckg:bckg
    property var pushProperties: ({})

    width: parent.width
    background:  Rectangle {
        id: bckg
        color: "#9a9a9a"
        radius: 10
        z: 5
        visible:false
    }
    Colorize {
        anchors.fill: parent
        source: bckg
        hue: ThemeInfo.hueValue
        saturation: 0.7
        lightness: ThemeInfo.backgroundLightness-ThemeInfo.elementSubtractor
        opacity: 0.8
    }
    focusPolicy: Qt.StrongFocus
    padding: 20
    font.capitalization: Font.AllUppercase
    font.pointSize: 15
    onPressed: {bckg.color="#808080"}
    onPressedChanged:  {bckg.color="#9a9a9a"}
    onClicked: if(target != "") stackView.push(target, pushProperties)

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


}
