import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("self-harm")
    items: [{text: qsTrId("self-harm-tips"),  file: "SwipeItems.qml", pushProperties: {"title" : qsTrId("self-harm-tips"), "listInputText":  qsTrId("selfHarm-tips")}},
            {text: qsTrId("self-harm-helped"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("self-harm-helped"), "headerText" : qsTrId("self-harm-helped-header"), "arrayNames" : ["selfHarmHelped"]}},
            {text: qsTrId("plan"), file: "Plan.qml", pushProperties: {"arrayId" : "selfHarmPlan" ,"questions" : selfHarmPlanQuestions}},
            {text: qsTrId("self-harm-timer"), file:  "SelfHarm/Timer.qml"},
            {text: qsTrId("breath"), file:  "Breath.qml"}
            ]
}
