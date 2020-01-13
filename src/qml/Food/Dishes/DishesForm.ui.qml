import QtQuick 2.4
import "../.."

Menu{
    title: qsTrId("food-dishes")
    items: [{text: qsTrId("food-breakfast"), file: "Food/Dishes/Breakfast.qml"},
            {text: qsTrId("food-am-snack"), file: "Food/Dishes/AmSnack.qml"},
            {text: qsTrId("food-lunch"), file: "Food/Dishes/Lunch.qml"},
            {text: qsTrId("food-pm-snack"), file: "Food/Dishes/PmSnack.qml"},
            {text: qsTrId("food-dinner"), file: "Food/Dishes/Dinner.qml"},
            ]
}

