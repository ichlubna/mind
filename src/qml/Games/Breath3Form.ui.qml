import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Shapes 1.12
import ".."

MenuPage {
    property alias path1Element: path1Element
    property alias path2Element: path2Element
    property alias path3Element: path3Element
    property alias sprite: sprite
    property alias shape1: shape1
    property alias shape2: shape2
    property alias shape3: shape3
    property alias breathSlider: breathSlider
    property alias breathElement: breathElement
    property alias number: number
    title: qsTrId("breath") + " III"

    property int numberSize: 150

    Description {
        text: qsTrId("breathe-info")
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
    }

    Description {
        id: number
        text: "1"
        font.pointSize: numberSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Description {
        id: breathElement
        text: qsTrId("breathe-in")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Shape {
           id: sprite
           anchors.fill: parent
    ShapePath {
        id: shape1
        strokeColor: "white"
        strokeWidth: 5
        capStyle: ShapePath.RoundCap
        startX: parent.width*0.1
        startY: parent.height*0.3
        PathLine {id: path1Element; x: parent.width*0.1; y: parent.height*0.3}
    }

    ShapePath {
        id: shape2
        strokeColor: "white"
        strokeWidth: 5
        capStyle: ShapePath.RoundCap
        startX: parent.width*0.9
        startY: parent.height*0.3
        PathLine {id: path2Element; x: parent.width*0.9; y: parent.height*0.3}
    }

    ShapePath {
        id: shape3
        strokeColor: "white"
        strokeWidth: 5
        capStyle: ShapePath.RoundCap
        startX: parent.width*0.5
        startY: parent.height*0.8
        PathLine {id: path3Element; x: parent.width*0.5; y: parent.height*0.8}
    }}

    MenuSlider {
        id: breathSlider
        maximumValue: 1.5
        minimumValue: 0.5
        anchors.bottom: parent.bottom
    }

    DescriptionLabel{
        text: qsTrId("breathe-slider")
        anchors.bottom: breathSlider.top
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
    }
}
