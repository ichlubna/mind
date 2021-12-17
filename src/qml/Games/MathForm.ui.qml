import QtQuick
import Qt5Compat.GraphicalEffects
import ".."

MenuPage {
    id: mathPage
    property alias exercise: exercise
    property alias submitButton: submitButton
    property alias answer: answer
    property alias anim: anim
    title: qsTrId("math")

    Image {
            id: anim
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            opacity: 0.0
            z: 10
    }

    Description{
        id: exercise
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 50

        MenuTextArea {
            id: answer
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: exercise.paintedHeight+50
            width: parent.width/2
            inputMethodHints: Qt.ImhDigitsOnly
        }

        MenuButton {
            text: qsTrId("submit")
            anchors.horizontalCenter: parent.horizontalCenter
            id: submitButton
            anchors.top: answer.bottom
            anchors.topMargin: 10
            width: parent.width/2
        }

    }
}

