import QtQuick 2.4
import "../.."

SwipePage {
    id: foodFigurePage
    title: qsTrId("food-figure")
    property alias itemsContainer: itemsContainer

    SwipeItems{
           id: itemsContainer
    }
}
