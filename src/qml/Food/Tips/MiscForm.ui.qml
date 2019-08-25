import QtQuick 2.4
import "../.."

SwipePage {
    id: foodMiscPage
    title: qsTrId("food-misc")
    property alias itemsContainer: itemsContainer

    SwipeItems{
           id: itemsContainer
    }
}
