import QtQuick 2.4

SwipePage {
    id: selfHarmTipsPage
    title: qsTrId("self-harm-tips")
    property alias itemsContainer: itemsContainer

    SwipeItems{
           id: itemsContainer
    }


}
