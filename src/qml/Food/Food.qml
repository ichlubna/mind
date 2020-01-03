import QtQuick 2.4

FoodForm {   
        tipsButton.onClicked: stackView.push("Tips/Tips.qml")
        tasksButton.onClicked: stackView.push("Tasks/Tasks.qml")
        dishesButton.onClicked: stackView.push("Dishes/Dishes.qml")
        contactButton.onClicked: stackView.push("Contact.qml")
        distractionButton.onClicked: stackView.push("Distraction.qml")

        Connections {
            target: contactButton
            Component.onCompleted: {
                if(dataProvider.loadLanguage() === "PL" || dataProvider.loadLanguage() === "IT" || dataProvider.loadLanguage() === "FR" || dataProvider.loadLanguage() === "EN" || dataProvider.loadLanguage() === "ES")
                    contactButton.visible = false;
            }
        }
}
