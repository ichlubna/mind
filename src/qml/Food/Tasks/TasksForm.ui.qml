import QtQuick
import "../.."

Menu{
    title: qsTrId("food-tasks")
    items: [{text: qsTrId("food-tasks-creative"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("food-tasks-creative"), "type" : "LC", "arrayNames" : ["foodCreative", "foodCreativeC"]}},
            {text: qsTrId("food-tasks-motivation"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("food-tasks-motivation"), "headerText" : qsTrId("food-motivation-header"), "type" : "LC", "arrayNames" : ["foodMotivation", "foodMotivationC"]}},
            {text: qsTrId("food-tasks-challenge"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("food-tasks-challenge"), "type" : "LC", "arrayNames" : ["foodChallenge", "fodChallengeC"]}},
            {text: qsTrId("food-tasks-like"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("food-tasks-like"), "headerText" : qsTrId("food-like-header"), "arrayNames" : ["foodLike"]}},
            {text: qsTrId("food-tasks-food-like"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("food-tasks-food-like"), "headerText" : qsTrId("food-food-like-header"), "arrayNames" : ["foodFoodLike"]}},
            {text: qsTrId("food-tasks-afraid"), file: "ArrayUpdater.qml", pushProperties: {"titleText" : qsTrId("food-tasks-afraid"), "headerText" : qsTrId("food-afraid-header"), "type" : "LC", "arrayNames" : ["foodAfraid", "foodAfraidC"]}}
            ]
}
