import QtQuick 2.4
import ".."

MenuPage {
    id: foodPage
    property alias tipsButton: tipsButton
    property alias tasksButton: tasksButton
    property alias dishesButton: dishesButton
    property alias contactButton: contactButton
    property alias distractionButton: distractionButton
    property alias menuCol: menuCol
    title: qsTrId("food")

   MenuColumn{
       id: menuCol
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
            id: distractionButton
            text: qsTrId("distraction")
        }

        MenuButton {
            id: contactButton
            text: qsTrId("food-contact")
        }
    }
}
