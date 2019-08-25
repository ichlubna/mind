import QtQuick 2.4

FailForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("food-fail-text").split('|')
        }
    }
}
