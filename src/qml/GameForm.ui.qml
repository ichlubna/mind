import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.12

MenuPage {
    id: gamePage
    property alias balls: balls
    property alias gamePage: gamePage
    property alias particles: particles
    property alias gameText: gameText
    title: qsTrId("game")

    Description{
        id: gameText
        width:parent.width
        text: qsTrId("game-instructions")
    }

    Repeater {
        id: balls
        model: 1
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
    ParticleSystem {
        anchors.fill: parent

        ImageParticle {
            source: "qrc:/images/star.svg"
            rotationVariation: 100
        }
        Emitter {
            id: particles
            size: 20
            sizeVariation: 20
            height: 1
            width: 1
            lifeSpan: 1000
            lifeSpanVariation: 500
            velocity: TargetDirection{
                       targetX: 0; targetY: 0
                       targetVariation: 360
                       magnitude: 800
                       magnitudeVariation: 600
                   }
            enabled: false
        }
        Gravity {
            anchors.fill: parent
            angle: 90
            acceleration: 500
        }
    }
}
