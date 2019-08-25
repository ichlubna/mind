import QtQuick 2.4

MiscForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("food-misc-text").split('|')
        }
    }
}
