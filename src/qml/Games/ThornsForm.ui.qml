import QtQuick
import QtQuick.Shapes
import ".."

MenuPage {
    property alias slashArea: slashArea
    property alias thorns: thorns
    property alias core: core
    title: qsTrId("game-thorns")

    Shape {
        anchors.fill: parent
        opacity: 0.5
        visible: slashing
        antialiasing: true
    ShapePath {
        strokeColor: "white"
        strokeWidth: 5
        fillColor: "transparent"
        capStyle: ShapePath.RoundCap
        startX: slashStartX
        startY: slashStartY
        PathLine { x: slashEndX; y: slashEndY; }
    }}

    Repeater {
        id: thorns
        anchors.fill: parent
        model: thornsNum
        Rectangle {
            property var directionX
            property var directionY
            property var thornRotation
            width: parent.height * 0.5
            height: width*0.1
            color: "white"
            opacity: 0.5
            transform: Rotation { angle: thornRotation}
    }}

    MouseArea
    {
        id: slashArea
        anchors.fill: parent
        hoverEnabled: true
    }

    Image {
            id: core
            anchors.centerIn: parent
            width: parent.width*0.2
            height: width
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/emoticon1.svg"
    }

}

