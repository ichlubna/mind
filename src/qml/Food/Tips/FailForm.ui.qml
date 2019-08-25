import QtQuick 2.4
import "../.."

SwipePage {
    id: foodFailPage
    title: qsTrId("food-fail")
    property alias itemsContainer: itemsContainer

    SwipeItems{
           id: itemsContainer
    }
}
