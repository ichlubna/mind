import QtQuick 2.4

AdvicesForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("food-tips-text").split('|')
        }
    }
}
