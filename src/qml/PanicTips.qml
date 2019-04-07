import QtQuick 2.4

PanicTipsForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("panic-tips").split('|')
        }
    }
}
