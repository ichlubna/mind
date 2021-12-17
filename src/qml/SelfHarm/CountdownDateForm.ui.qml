import QtQuick
import ".."

SwipePage{
    property alias okButton: okButton
    property alias recordDate: recordDate
    title: qsTrId("self-harm-timer")

    DatePicker {
        id: recordDate
        width: parent.width*0.9
        height: parent.height*0.7
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        futureYears: 0
        firstYear: 2015
    }

    MenuButton{
        id: okButton
        text: "OK"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height*0.1
        width: parent.width*0.8
        opacity: (enabled) ? 1.0 : 0.5
    }
}
