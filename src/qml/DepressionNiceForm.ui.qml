import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

MenuPage {
    id: depressionPlanPage
    title: qsTrId("depression-nice")
    property alias addButton: addButton
    property alias itemList: itemList
    property alias itemListR: itemListR
    property alias viewContainer: viewContainer

    ArrayUpdater{
        id: updater
        arrayName: "nice"
    }

    Description {
        id: niceHeader
        text: qsTrId("deperssion-nice-header")
    }

    ScrollView {
        id: viewContainer
        anchors.fill: parent
        anchors.topMargin: niceHeader.paintedHeight + 20
        contentWidth: -1
        clip: true

        GridLayout {
            anchors.fill: parent
            columns: 2

            Repeater {
                id: itemList
                model: 1
                MenuTextInput {
                    Layout.preferredWidth: parent.width
                    Layout.row: index
                    Layout.column: 0
                    Layout.leftMargin: 10
                    Layout.fillWidth: true
                }
            }

            Repeater {
                id: itemListR
                model: 1
                Image {
                    source: "qrc:/images/delete.svg"
                    Layout.preferredWidth: parent.width * 0.05
                    Layout.preferredHeight: parent.width * 0.05
                    Layout.row: index
                    Layout.column: 1
                    Layout.rightMargin: 10
                    MouseArea {
                        anchors.fill: parent
                        Connections {
                            onClicked: {
                                updater.remove(index)
                            }
                        }
                    }
                }
            }

            Item {
                height: 100
                width: 50
            }
        }
    }
    AddButton {
        id: addButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 5
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
