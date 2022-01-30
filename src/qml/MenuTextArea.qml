import QtQuick
import QtQuick.Controls 2.4

TextArea {
    id: area
    padding: 10
    background: Rectangle {
        color: "#1F000000"
        opacity: 1
        radius: 5
        anchors.fill: parent
        border.color: "#50FFFFFF"
        border.width: 1
    }
    font.pointSize: 20
    color: "White"
    selectedTextColor: "Black"
    wrapMode: TextEdit.Wrap

    property string placeholder: ""

    Text {
        text: area.placeholder
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        color: "White"
        opacity: 0.3
        font.pointSize: area.font.pointSize
        visible: !area.text && !area.activeFocus
    }
}
