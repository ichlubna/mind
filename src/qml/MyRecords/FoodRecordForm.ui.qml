import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import ".."

SwipePage {
    property alias view: view
    property alias removeArea: removeArea
    property alias confirmArea: confirmArea
    property alias questions: questions
    property alias popup: popup
    title: qsTrId("diary")

    InputScrollView {
        id: view

        ColumnLayout {
            spacing: 10
            anchors.fill: parent
            id: questions

            Item {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: view.height * 0.1

                Image {
                    source: "qrc:/images/delete.svg"
                    height: view.height * 0.095
                    width: view.height * 0.095
                    fillMode: Image.PreserveAspectFit
                    anchors.right: parent.right
                    MouseArea {
                        anchors.fill: parent
                        id: removeArea
                    }
                }
                Image {
                    source: "qrc:/images/tick.svg"
                    height: view.height * 0.09
                    width: view.height * 0.09
                    fillMode: Image.PreserveAspectFit
                    anchors.left: parent.left
                    MouseArea {
                        anchors.fill: parent
                        id: confirmArea
                    }
                }
            }

            DescriptionLabel {
                text: qsTrId("food-record-when")
                Layout.fillWidth: true
            }
            MenuTextArea {
                Layout.fillWidth: true
            }
            DescriptionLabel {
                text: qsTrId("food-record-where")
                Layout.fillWidth: true
            }
            MenuTextArea {
                Layout.fillWidth: true
            }
            DescriptionLabel {
                text: qsTrId("food-record-with")
                Layout.fillWidth: true
            }
            MenuTextArea {
                Layout.fillWidth: true
            }
            DescriptionLabel {
                text: qsTrId("food-record-what")
                Layout.fillWidth: true
            }
            MenuTextArea {
                Layout.fillWidth: true
            }
            DescriptionLabel {
                text: qsTrId("food-record-feel")
                Layout.fillWidth: true
            }
            MenuTextArea {
                Layout.fillWidth: true
            }
            DescriptionLabel {
                text: qsTrId("food-record-problems")
                Layout.fillWidth: true
            }
            MenuTextArea {
                Layout.fillWidth: true
            }
        }
    }
    PopupWindow {
        id: popup
        msg.text: qsTrId("really-remove")
    }
}
