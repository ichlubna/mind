import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.13

MenuPage {
    id: gamePage
    property alias balls: balls
    property alias gamePage: gamePage
    title: qsTrId("game")

    Repeater {
        id: balls
        model: 1
        GameBall {
        }
    }

    ParticleSystem {
        id: sys
    }

    Emitter {
        velocity: PointDirection {
            xVariation: 4
            yVariation: 4
        }
        acceleration: PointDirection {
            xVariation: 10
            yVariation: 10
        }
        size: 8
        sizeVariation: 4
        anchors.fill: parent
        system: sys
        ImageParticle {
            anchors.fill: parent
            system: sys
            source: "qrc:/images/back.svg"
            clip: true
            id: redblip
        }

        lifeSpan: 6000
    }
}
