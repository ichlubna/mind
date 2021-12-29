import QtQuick
import ".."

MenuPage {
    property alias anim: anim
    title: qsTrId("game-thorns")

    Repeater {
        id: obstacles
        model: obstaclesNum
        Rectangle {
            height: parent.width * 0.25
            width: height
            color: "red"
            radius: width * 0.5
            property bool wanted: false
            opacity: 0.5
            MouseArea {
                id: a
                anchors.fill: parent
                Connections {
                    target: a
                    onClicked: {
                        hit(index)
                    }
                }
            }
        }
    }

    Image {
            id: anim
            anchors.centerIn: parent
            width: parent.width*0.5
            height: width
            fillMode: Image.PreserveAspectFit
            opacity: 0.0
            z: 10
    }

}

