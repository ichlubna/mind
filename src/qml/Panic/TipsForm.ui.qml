import QtQuick 2.4
import ".."

SwipePage {
    id: panicTipsPage
    title: qsTrId("panicTips")
    property alias itemsContainer: itemsContainer

    SwipeItems{
           id: itemsContainer
    }
}
