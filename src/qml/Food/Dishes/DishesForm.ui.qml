import QtQuick 2.4
import "../.."

MenuPage {
    id: foodDishesPage
    property alias breakfastButton: breakfastButton
    property alias amSnackButton: amSnackButton
    property alias lunchButton: lunchButton
    property alias pmSnackButton: pmSnackButton
    property alias dinnerButton: dinnerButton
    title: qsTrId("food-dishes")

MenuColumn{
    MenuButton {
        id: breakfastButton
        text: qsTrId("food-breakfast")
    }
    MenuButton {
        id: amSnackButton
        text: qsTrId("food-am-snack")
    }
     MenuButton {
         id: lunchButton
         text: qsTrId("food-lunch")
     }

     MenuButton {
         id: pmSnackButton
         text: qsTrId("food-pm-snack")
     }

     MenuButton {
         id: dinnerButton
         text: qsTrId("food-dinner")
     }
 }
}
