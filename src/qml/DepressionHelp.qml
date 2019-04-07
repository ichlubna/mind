import QtQuick 2.4

DepressionHelpForm {
    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("depression-tips").split('|')
        }
    }
}
