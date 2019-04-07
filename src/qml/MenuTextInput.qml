import QtQuick 2.0
import QtQuick.Controls 2.2

TextField {
    id: textArea
    background: Rectangle{
        color:"White"
        opacity: 1
        radius: 5
        height: 3
        anchors.bottom: parent.bottom
        border.color: "White"
        border.width: 5}
    font.pointSize: 20
    onFocusChanged: (focus) ? selectAll() : deselect()
    color: "White"
    selectedTextColor: "Black"
}
