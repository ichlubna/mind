import QtQuick
import ".."

Menu{
    title: qsTrId("games")
    items: [{text: qsTrId("game-balls"), file: "Games/Balls.qml"},
            {text: qsTrId("game-balance"), file: "Games/Balance.qml"},

            ]
}
