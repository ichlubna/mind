import QtQuick 2.4

VomitForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("food-vomit-text").split('|')
        }
    }
}
