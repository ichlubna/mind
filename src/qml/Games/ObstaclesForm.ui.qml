import QtQuick
import ".."

MenuPage {
    property alias character: character
    property alias obstacles: obstacles
    property alias leftArea: leftArea
    property alias rightArea: rightArea
    id: gamePage
    title: qsTrId("game-obstacles")

    Repeater {
        id: obstacles
        model: obstaclesNum
        anchors.fill: parent
        Rectangle {
            property real area: 0.2
            width: parent.width * area
            height: width*0.5
            y: parent.height+2*height;
            color: "white"
            opacity: 0.7
        }
    }

    MouseArea
    {
        id: leftArea
        width: parent.width*0.5
        height: parent.height
        anchors.left: parent.left
    }
    MouseArea
    {
        id: rightArea
        width: parent.width*0.5
        height: parent.height
        anchors.right: parent.right
    }

    Image {
            id: character
            width: parent.width*0.14
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            height: width
            source: "qrc:/images/emoticon1.svg"
            fillMode: Image.PreserveAspectFit
    }

}

