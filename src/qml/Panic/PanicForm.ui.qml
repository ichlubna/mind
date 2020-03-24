import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("anxiety-panic")
    items: [{text: qsTrId("panicTips"), file: "SwipeItems.qml", pushProperties: {"title" :qsTrId("panicTips"), "listInputText":  qsTrId("panic-tips")}},
            {text: qsTrId("breath"), file: "Breath.qml"},
            {text: qsTrId("math"), file: "Games/Math.qml"},
            {text: qsTrId("game"), file: "Games/Balls.qml"},
            {text: qsTrId("relaxation"), file: "Player.qml", pushProperties: {"titleText" : qsTrId("relaxation"), "file" : "qrc:/audio/relaxCS.mp3"}, excluded: czSkOnly}
            ]
}

