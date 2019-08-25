import QtQuick 2.4
import ".."

SwipePage {
    id: depressionHelpPage
    title: qsTrId("depression-help")

    property alias itemsContainer: itemsContainer

    SwipeItems {
        id: itemsContainer
    }
}
