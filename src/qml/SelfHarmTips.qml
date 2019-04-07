import QtQuick 2.4

SelfHarmTipsForm {

    Connections {
        target: itemsContainer
        Component.onCompleted: {
            itemsContainer.items = qsTrId("selfHarm-tips").split('|')
        }
    }
}
