import QtQuick 2.4

FoodForm {   
        tipsButton.onClicked: stackView.push("Tips/Tips.qml")
        tasksButton.onClicked: stackView.push("Tasks/Tasks.qml")
        dishesButton.onClicked: stackView.push("Dishes/Dishes.qml")
        storiesButton.onClicked: stackView.push("Stories.qml")
        contactButton.onClicked: stackView.push("Contact.qml")
}
