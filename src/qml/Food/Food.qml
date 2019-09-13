import QtQuick 2.4

FoodForm {   
        tipsButton.onClicked: stackView.push("Tips/Tips.qml")
        tasksButton.onClicked: stackView.push("Tasks/Tasks.qml")
        dishesButton.onClicked: stackView.push("Dishes/Dishes.qml")
        storiesButton.onClicked: stackView.push("Stories.qml")
        contactButton.onClicked: stackView.push("Contact.qml")
        distractionButton.onClicked: stackView.push("Distraction.qml")

        Connections {
            target: menuCol
            Component.onCompleted: {
                if(dataProvider.loadLanguage() === "FR")
                    menuCol.visible = false;
            }
        }

        Connections {
            target: comming
            Component.onCompleted: {
                if(dataProvider.loadLanguage() === "FR")
                    comming.visible = true;
            }
        }

        Connections {
            target: contactButton
            Component.onCompleted: {
                if(dataProvider.loadLanguage() === "PL")
                    contactButton.visible = true;
            }
        }
}
