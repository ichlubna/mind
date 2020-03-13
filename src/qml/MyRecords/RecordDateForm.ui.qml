import QtQuick 2.4
import ".."

SwipePage{
    property alias okButton: okButton
    property alias recordDate: recordDate
    title: qsTrId("diary-record-date")

    DatePicker {
        id: recordDate
        width: parent.width*0.9
        height: parent.height*0.7
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
    }

    MenuButton{
        id: okButton
        text: "OK"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height*0.1
        width: parent.width*0.8
    }
}
