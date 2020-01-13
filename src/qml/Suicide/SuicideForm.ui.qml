import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("suicidal-thoughts")
    items: [{text: qsTrId("plan"), file: "Suicide/Plan.qml"},
            {text: qsTrId("reasons"), file: "Suicide/Reasons.qml"},
            {text: qsTrId("breath1"), file: "Games/Breath1.qml"},
            {text: qsTrId("breath2"), file: "Games/Breath2.qml"},
            {text: qsTrId("breath3"), file: "Games/Breath3.qml"}
            ]
}
