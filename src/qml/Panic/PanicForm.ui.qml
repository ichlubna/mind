import QtQuick
import ".."

Menu{
    title: qsTrId("anxiety-panic")
    items: [{text: qsTrId("panicTips"), file: "SwipeItems.qml", pushProperties: {"withDescription" : true, "title" :qsTrId("panicTips"), "listInputText":  qsTrId("panic-tips")}},
            {text: qsTrId("breath"), file: "Breath/Breath.qml"},
            {text: qsTrId("distraction"), file: "Distraction.qml"},
            {text: qsTrId("relaxation"), file: "Player.qml", pushProperties: {"titleText" : qsTrId("relaxation"), "file" : relaxationFile}, excluded: czSkOnly},
            {text: qsTrId("sources"), file: "Sources.qml", pushProperties: {"section" : "panic"}},
            ]
}

