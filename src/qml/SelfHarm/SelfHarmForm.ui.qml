import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("self-harm")
    items: [{text: qsTrId("self-harm-tips"), file: "SelfHarm/Tips.qml"},
            {text: qsTrId("breath1"), file: "Games/Breath1.qml"},
            {text: qsTrId("breath2"), file: "Games/Breath2.qml"},
            {text: qsTrId("breath3"), file: "Games/Breath3.qml"}
            ]
}
