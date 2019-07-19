import QtQuick.Controls 2.12
import QtQuick 2.12

ComboBox {
    width: parent.width*0.9
    anchors.horizontalCenter: parent.horizontalCenter
    id: comboBox
    font.pointSize: 15
    background: Rectangle {
        radius: 5
        border.width: 2
        border.color: "white"
        color: "#50000000"
   }
    popup.background: Rectangle {
        radius: 5
        border.width: 2
        border.color: "white"
        color: "#E0000000"
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
