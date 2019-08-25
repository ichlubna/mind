import QtQuick 2.4

FigureForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("food-figure-text").split('|')
        }
    }
}
