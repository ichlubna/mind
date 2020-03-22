import QtQuick 2.0
import QtQuick.Controls 2.4

TextArea{
    id: neco
    padding: 10
    background: Rectangle{
        color:"#1F000000"
        opacity: 1
        radius: 4
        anchors.fill: parent
        border.color: "White"
        border.width: 3}
    font.pointSize: 20
    color: "White"
    selectedTextColor: "Black"
    wrapMode: TextEdit.Wrap
}
