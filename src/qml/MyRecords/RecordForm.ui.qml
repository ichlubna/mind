import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.3
import ".."

SwipePage {
    property alias view: view
    property alias removeArea: removeArea
    property alias confirmArea: confirmArea
    property alias questions: questions
    property alias popup: popup
    title: titleText
    id: recordPage

    InputScrollView {
        id: view

    ColumnLayout {
        spacing: 5
        //anchors.fill: parent
        width: recordPage.width*0.95
        id: questions

        Repeater{
            model: questionTexts
            ColumnLayout{
                DescriptionLabel {
                    Layout.fillWidth: true
                    text: modelData.question
                }

                MenuTextArea {
                    Layout.fillWidth: true
                    visible: modelData.type === "text"
                }

                GridLayout{
                    columns: 2
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    visible: modelData.type === "ticks"

                    Repeater{
                        model: modelData.ticks
                            DescriptionLabel {
                                text: modelData
                                Layout.column: 0
                                Layout.row: index
                            }}
                    Repeater{
                            model: modelData.ticks
                            MenuCheckBox{
                                objectName: "tick"
                                Layout.column: 1
                                Layout.row: index
                            }
                    }
                }
                LineDelimiter{ visible: index !== questionTexts.length-1}
            }
        }
            Item {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: view.height * 0.1

                Image {
                    source: "qrc:/images/delete.svg"
                    height: view.height * 0.095
                    width: view.height * 0.095
                    fillMode: Image.PreserveAspectFit
                    anchors.left: parent.left
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
                    anchors.right: parent.right
                    MouseArea {
                        anchors.fill: parent
                        id: confirmArea
                    }
                }
            }

            Item {
                height: 300
                width: 50
            }
        }
    }
    PopupWindow {
        id: popup
        msg.text: qsTrId("really-remove")
    }
}
