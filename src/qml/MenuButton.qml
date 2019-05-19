import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.2

Button {
    property alias bckg:bckg
    width: parent.width
    background:  Rectangle {
        id: bckg
        color: "#9a9a9a"
        radius: 10
    }
    Colorize {
        anchors.fill: parent
        source: bckg
        hue: ThemeInfo.hueValue
        saturation: 0.7
        lightness: ThemeInfo.backgroundLightness-ThemeInfo.elementSubtractor
    }
    focusPolicy: Qt.StrongFocus
    padding: 20
    font.capitalization: Font.AllUppercase
    font.pointSize: 15
    onPressed: {bckg.color="#808080"}
    onPressedChanged:  {bckg.color="#9a9a9a"}

}
