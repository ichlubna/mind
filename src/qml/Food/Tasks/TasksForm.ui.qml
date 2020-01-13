import QtQuick 2.4
import "../.."

Menu{
    title: qsTrId("food-tasks")
    items: [{text: qsTrId("food-tasks-creative"), file: "Food/Tasks/Creative.qml"},
            {text: qsTrId("food-tasks-motivation"), file: "Food/Tasks/Motivation.qml"},
            {text: qsTrId("food-tasks-challenge"), file: "Food/Tasks/Challenge.qml"},
            {text: qsTrId("food-tasks-like"), file: "Food/Tasks/Like.qml"},
            {text: qsTrId("food-tasks-food-like"), file: "Food/Tasks/FoodLike.qml"},
            {text: qsTrId("food-tasks-afraid"), file: "Food/Tasks/Afraid.qml"},
            ]
}
