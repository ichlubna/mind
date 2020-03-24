import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("self-harm")
    items: [{text: qsTrId("self-harm-tips"),  file: "SwipeItems.qml", pushProperties: {"title" : qsTrId("self-harm-tips"), "listInputText":  qsTrId("selfHarm-tips")}},
            {text: qsTrId("breath"), file:  "Breath.qml"}
            ]
}
