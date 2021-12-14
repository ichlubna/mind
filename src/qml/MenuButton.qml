import QtQuick 2.0
import QtQuick.Controls 2.12
import Qt5Compat.GraphicalEffects

Button {
    property string target: ""
    property string link: ""
    property alias bckg: bckg
    property var pushProperties: ({})

    width: parent.width
    background: Rectangle {
        id: bckg
        gradient: Gradient {
                GradientStop { position: 0.0; color: "#9a9a9a" }
                GradientStop { position: 0.5; color: "#a6a6a6" }
                GradientStop { position: 1.0; color: "#9a9a9a" }
            }
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
        opacity: 0.75
    }

    focusPolicy: Qt.StrongFocus
    padding: 20
    onPressed: {
        bckg.color = "#808080"
    }
    onPressedChanged: {
        bckg.color = "#9a9a9a"
    }
    onClicked: if (link != "")
                   Qt.openUrlExternally(link)
               else if (target != "")
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
        opacity: 0.1
    }
}
