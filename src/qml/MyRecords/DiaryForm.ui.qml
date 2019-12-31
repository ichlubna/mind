import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import ".."

MenuPage {
    property alias addButton: addButton
    property alias records: records
    property alias viewContainer: viewContainer
    property var col1Ratio: 0.3
    property var col2Ratio: 0.7
    title: qsTrId("diary")

    ScrollView {
        id: viewContainer
        anchors.fill: parent
        contentWidth: -1
        clip: true
        anchors.margins: 10

        ColumnLayout {
            anchors.fill: parent

            Repeater {
                id: records
                model: 0
                Item {
                    Layout.row: index
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height*0.1

                    DescriptionLabel {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                    }

                    Rectangle{color: "black"
                        anchors.fill: parent
                        opacity: 0.1
                     }
                   MouseArea {
                        anchors.fill: parent
                        Connections {
                            onClicked: {
                                stackView.push("DiaryRecord.qml", {"recordIndex": index})
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
        AddButton {
            id: addButton
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 5
        }
    }
}
