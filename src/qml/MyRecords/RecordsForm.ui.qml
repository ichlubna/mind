import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import ".."

MenuPage {
    property alias addButton: addButton
    property alias sendArea: sendArea
    property alias records: records
    property alias viewContainer: viewContainer
    property var col1Ratio: 0.3
    property var col2Ratio: 0.7
    title: qsTrId("diary")
    id: viewContainer

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: column.width
        contentHeight: column.height

        Column {
            id: column
            Repeater {
                id: records
                Item {
                    property var header: false
                    property var position: 0
                    width: viewContainer.width
                    height: viewContainer.height*0.2

                    DescriptionLabel {
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        anchors.margins: 10
                        font.bold: header
                    }

                    Row {
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        spacing: 5
                        visible: dateOnly
                        Repeater{
                            model: 6
                            Image {
                                property var ok: false
                                source: (ok) ? "qrc:/images/tick.svg" : "qrc:/images/delete.svg"
                                height: parent.height*0.3
                                width: parent.height*0.3
                                anchors.verticalCenter: parent.verticalCenter
                                fillMode: Image.PreserveAspectFit
                            }
                    }}

                    Rectangle{color: (index%2 == 0) ? "black" : "white"
                        anchors.fill: parent
                        opacity: (header) ? 0.0 : 0.2
                     }
                   MouseArea {
                        anchors.fill: parent
                        Connections {
                            onClicked: {
                                stackView.push(afterDateFile, {"recordIndex": position})
                            }
                        }
                    }
                }
            }
            Item {
                height: 50
                width: 50
            }
        }}
        AddButton {
            id: addButton
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 5
        }

        Image {
            source: "qrc:/images/letter.svg"
            height: parent.height * 0.15
            width: parent.height * 0.15
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 5
            fillMode: Image.PreserveAspectFit
            MouseArea {
                anchors.fill: parent
                id: sendArea
            }
            visible: dateOnly
        }
}
