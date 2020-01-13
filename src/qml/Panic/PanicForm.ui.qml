import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("anxiety-panic")
    items: [{text: qsTrId("panicTips"), file: "Panic/Tips.qml"},
            {text: qsTrId("breath1"), file: "Games/Breath1.qml"},
            {text: qsTrId("breath2"), file: "Games/Breath2.qml"},
            {text: qsTrId("breath3"), file: "Games/Breath3.qml"},
            {text: qsTrId("math"), file: "Games/Math.qml"},
            {text: qsTrId("game"), file: "Games/Balls.qml"}
            ]
}

