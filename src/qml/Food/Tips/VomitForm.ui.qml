import QtQuick 2.4
import "../.."

SwipePage {
    id: foodVomitPage
    title: qsTrId("food-vomit")
    property alias itemsContainer: itemsContainer

    SwipeItems{
           id: itemsContainer
    }
}
