import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("self-harm")
    items: [{text: qsTrId("self-harm-tips"), file: "SelfHarm/Tips.qml"},
            {text: qsTrId("breath"), file:  "Breath.qml"}
            ]
}
