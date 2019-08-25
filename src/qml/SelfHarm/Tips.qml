import QtQuick 2.4

TipsForm {

    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("selfHarm-tips").split('|')
        }
    }
}
