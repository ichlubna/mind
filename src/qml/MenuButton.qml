import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Button {
    property var target: ""
    property alias bckg: bckg
    property var pushProperties: ({})

    width: parent.width
    background: Rectangle {
        id: bckg
        color: "#9a9a9a"
        radius: 10
        z: 5
        visible: false
    }
    Colorize {
        anchors.fill: parent
        source: bckg
        hue: ThemeInfo.hueValue
        saturation: 0.7
        lightness: ThemeInfo.backgroundLightness - ThemeInfo.elementSubtractor
        opacity: 0.8
    }

    focusPolicy: Qt.StrongFocus
    padding: 20
    onPressed: {
        bckg.color = "#808080"
    }
    onPressedChanged: {
        bckg.color = "#9a9a9a"
    }
    onClicked: if (target != "")
                   stackView.push(target, pushProperties)

    contentItem: Text {
        text: parent.text
        minimumPointSize: 13
        fontSizeMode: Text.Fit
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        font.capitalization: Font.AllUppercase
        color: "white"
    }

    Shadow {
        anchors.fill: bckg
        source: bckg
    }
}
