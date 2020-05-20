import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("suicidal-thoughts")
    items: [{text: qsTrId("plan"), file: "Plan.qml", pushProperties: {"arrayId" : "suicidePlan" ,"questions" : [  qsTrId("feeling-bad-write"),
                                                                           qsTrId("feeling-bad-write-body"),
                                                                           qsTrId("feeling-bad-do"),
                                                                           qsTrId("feeling-bad-go"),
                                                                           qsTrId("people-to-write")]}},
            {text: qsTrId("reasons"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("reasons"), "headerText" : qsTrId("reasons-text"), "arrayNames" : ["reasons"]}},
            {text: qsTrId("breath"), file: "Breath.qml"}
            ]
}
