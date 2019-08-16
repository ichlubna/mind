import QtQuick 2.4

FoodForm {   
        tipsButton.onClicked: stackView.push("FoodTipsMenu.qml")
        tasksButton.onClicked: stackView.push("FoodTasksMenu.qml")
        dishesButton.onClicked: stackView.push(".qml")
        storiesButton.onClicked: stackView.push(".qml")
        contactButton.onClicked: stackView.push(".qml")
}
