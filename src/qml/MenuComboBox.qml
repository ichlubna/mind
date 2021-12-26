import QtQuick.Controls
import QtQuick

ComboBox {
    width: parent.width*0.9
    anchors.horizontalCenter: parent.horizontalCenter
    id: comboBox
    font.pointSize: 15
    background: Rectangle {
        radius: 5
        border.color: "#50FFFFFF"
        border.width: 1
        color: "#50000000"
   }
    popup.background: Rectangle {
        radius: 5
        border.color: "#50FFFFFF"
        border.width: 1
        color: "#C0000000"
   }
    contentItem: Text {
        leftPadding: 10
        text: comboBox.displayText
        font: comboBox.font
        color: "white"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
