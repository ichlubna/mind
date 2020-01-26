import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("suicidal-thoughts")
    items: [{text: qsTrId("plan"), file: "Suicide/Plan.qml"},
            {text: qsTrId("reasons"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("reasons"), "headerText" : qsTrId("reasons-text"), "arrayNames" : ["reasons"]}},
            {text: qsTrId("breath"), file: "Breath.qml"}
            ]
}
