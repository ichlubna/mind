import QtQuick 2.4

HelpForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("depression-tips").split('|')
        }
    }
}
