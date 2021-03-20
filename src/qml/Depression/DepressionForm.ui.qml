import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("depression")
    items: [{text: qsTrId("depression-help"), file: "SwipeItems.qml", pushProperties: {"withDescription" : true, "title" : qsTrId("depression-help"), "listInputText":  qsTrId("depression-tips")}},
            {text: qsTrId("depression-plan"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("depression-plan"), "headerText" : qsTrId("depression-plan-header"), "type" : "LC", "arrayNames" : ["plan", "planC"]}},
            {text: qsTrId("depression-nice"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("depression-nice"), "headerText" : qsTrId("depression-nice-header"), "arrayNames" : ["nice"]}},
            {text: qsTrId("depression-praise"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("depression-praise"), "headerText" : qsTrId("depression-praise-header"), "arrayNames" : ["praise"]}},
            ]
}
