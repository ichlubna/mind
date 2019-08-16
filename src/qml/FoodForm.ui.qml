import QtQuick 2.4

MenuPage {
    id: foodPage
    property alias foodPage: foodPage
    property alias tipsButton: tipsButton
    property alias tasksButton: tasksButton
    property alias dishesButton: dishesButton
    property alias storiesButton: storiesButton
    property alias contactButton: contactButton
    title: qsTrId("food")

   MenuColumn{
       MenuButton {
           id: tipsButton
           text: qsTrId("food-tips")
       }
       MenuButton {
           id: tasksButton
           text: qsTrId("food-tasks")
       }
        MenuButton {
            id: dishesButton
            text: qsTrId("food-dishes")
        }

        MenuButton {
            id: storiesButton
            text: qsTrId("food-stories")
        }

        MenuButton {
            id: contactButton
            text: qsTrId("food-contact")
        }
    }
}
