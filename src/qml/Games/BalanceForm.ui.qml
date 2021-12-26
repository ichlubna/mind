import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Particles
import QtQuick.Shapes

import ".."

MenuPage {
    property alias gameText: gameText
    property alias seesaw: seesaw
    property alias rightWind: rightWind
    property alias leftWind: leftWind
    property alias particles: particles
    title: qsTrId("game")

    Description {
        id: gameText
        width: parent.width
        text: qsTrId("balance-game-instructions")
    }

    Shape {
        id: shape
        width: parent.width * 0.3
        height: parent.height * 0.57
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        opacity: 0.5
        ShapePath {
            fillColor: "white"
            startX: shape.width * 0.5
            startY: 0
            PathLine {
                x: shape.width
                y: shape.height
            }
            PathLine {
                x: 0
                y: shape.height
            }
            PathLine {
                x: shape.width * 0.5
                y: 0
            }
        }
    }

    Rectangle {
        id: seesaw
        rotation: 0
        width: parent.width * 0.7
        height: width * 0.05
        anchors.horizontalCenter: shape.horizontalCenter
        anchors.bottom: shape.top
        color: "white"
    }

    Rectangle {
        MouseArea {
            id: leftWind
            anchors.fill: parent
        }
        width: parent.width * 0.2
        height: shape.height * 0.4
        anchors.leftMargin: width * 0.1
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        border.color: "white"
        border.width: 10
        color: (leftWindPressed) ? "#AAFFFFFF" : "#5AFFFFFF"
        Image {
            width: parent.height*0.7
            height: parent.width*0.8
            rotation: 90
            anchors.centerIn: parent
            source: "qrc:/images/arrow.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        MouseArea {
            id: rightWind
            anchors.fill: parent
        }
        width: parent.width * 0.2
        height: shape.height * 0.4
        anchors.rightMargin: width * 0.1
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        border.color: "white"
        border.width: 10
        color: (rightWindPressed) ? "#AAFFFFFF" : "#5AFFFFFF"
        Image {
            width: parent.height*0.7
            height: parent.width*0.8
            rotation: 90
            anchors.centerIn: parent
            source: "qrc:/images/arrow.svg"
            fillMode: Image.PreserveAspectFit
        }
    }

    ParticleSystem {
        anchors.fill: parent

        ItemParticle{
            delegate: Rectangle {
                color: "white"
                opacity: 0.4
                width: 25
                height: width
                radius: width * 0.5
            }
        }

        Emitter {
            id: particles
            size: 5
            sizeVariation: 20
            height: 1
            width: 1
            lifeSpan: 1000
            lifeSpanVariation: 500
            velocity: AngleDirection {
                angle: -90
                angleVariation: 30
                magnitude: 800
                magnitudeVariation: 600
            }
            enabled: false
        }
        Gravity {
            anchors.fill: parent
            angle: 90
            magnitude: 500
        }
    }
}

