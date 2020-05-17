import QtQuick 2.5
import QtGraphicalEffects 1.0
import QtQuick.Particles 2.12
import ".."

MenuPage{
    property alias gameText: gameText
    title: qsTrId("game")

    Description{
        id: gameText
        width:parent.width
        text: qsTrId("balance-game-instructions")
    }

}
