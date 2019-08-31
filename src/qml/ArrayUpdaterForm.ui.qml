import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

MenuPage {
    property alias addButton: addButton
    property alias itemList: itemList
    property alias itemListC: itemListC
    property alias itemListR: itemListR
    property alias viewContainer: viewContainer
    property var headerText: ""

    Description {
        id: planHeader
        text: headerText
    }

    ScrollView {
        id: viewContainer
        anchors.fill: parent
        anchors.topMargin: planHeader.paintedHeight + 20
        contentWidth: -1
        clip: true
        anchors.margins: 10

        GridLayout {
            anchors.fill: parent
            columns: 3

            Repeater {
                id: itemListC
                model: 0
                MenuCheckBox {
                    Layout.row: index
                    Layout.column: 0
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                }
            }

            Repeater {
                id: itemList
                model: 0
                MenuTextInput {
                    Layout.preferredWidth: parent.width
                    Layout.row: index
                    Layout.column: 1
                    Layout.fillWidth: true
                }
            }

            Repeater {
                id: itemListR
                model: 0
                Image {
                    source: "qrc:/images/delete.svg"
                    Layout.preferredWidth: parent.width * 0.05
                    Layout.preferredHeight: parent.width * 0.05
                    Layout.row: index
                    Layout.column: 2
                    Layout.rightMargin: 10
                    MouseArea {
                        anchors.fill: parent
                        Connections {
                            onClicked: {
                                remove(index)
                            }
                        }
                    }
                }
            }

            Item {
                height: 50
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
