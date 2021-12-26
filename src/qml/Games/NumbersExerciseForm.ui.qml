import QtQuick
import ".."

MenuPage {
    id: mathPage
    property alias exercise: exercise
    property alias submitButton: submitButton
    property alias better: better
    property alias nah : nah
    title: qsTrId("numbers-exercise")

    property var exercises: [qsTrId("exercise-five"),qsTrId("exercise-four"),qsTrId("exercise-three"),qsTrId("exercise-two"),qsTrId("exercise-one")]
    property int currentID: 0
    property bool end: false

    Item{
        width: parent.width
        height: parent.height*0.6
        anchors.centerIn: parent
    Description{
        id: exercise
        horizontalAlignment: Text.AlignHCenter
        text: exercises[currentID]
        anchors.top: parent.top
        visible: !end
    }
    MenuButton {
        text: qsTrId("submit")
        anchors.horizontalCenter: parent.horizontalCenter
        id: submitButton
        anchors.bottom: parent.bottom
        width: parent.width/2
        visible: !end
    }

    MenuButton {
        text: qsTrId("feel-better")
        anchors.horizontalCenter: parent.horizontalCenter
        id: better
        anchors.top: parent.top
        width: parent.width/2
        visible: end
    }
    MenuButton {
        text: qsTrId("need-more-help")
        anchors.horizontalCenter: parent.horizontalCenter
        id: nah
        anchors.bottom: parent.bottom
        width: parent.width/2
        visible: end
    }
    }
}

