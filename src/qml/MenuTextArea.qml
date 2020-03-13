import QtQuick 2.0
import QtQuick.Controls 2.4

TextArea{
    padding: 10
    background: Rectangle{
        color:"#1F000000"
        opacity: 1
        radius: 4
        anchors.fill: parent
        border.color: "White"
        border.width: 3}
    font.pointSize: 20
    onActiveFocusChanged: {if (activeFocus) {/*selectAll();*/ outFocuser.z=999; this.z=999;} else {deselect(); this.z=1;}}
    color: "White"
    selectedTextColor: "Black"
    wrapMode: TextEdit.Wrap
}
