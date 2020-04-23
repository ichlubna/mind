import QtQuick 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import ".."

SwipePage {
    property alias view: view
    property alias removeArea: removeArea
    property alias confirmArea: confirmArea
    property alias questions: questions
    property alias popup: popup
    title: qsTrId("food-records")

    property var problemItems: [qsTrId("food-problems-vomit"), qsTrId("food-problems-exercise"), qsTrId("food-problems-self-harm"), qsTrId("food-problems-laxative"), qsTrId("food-problems-anxiety-attack")]
    property var feelItems: [qsTrId("food-problems-happy"), qsTrId("food-problems-satisfied"), qsTrId("food-problems-proud"), qsTrId("food-problems-fear"), qsTrId("food-problems-anger"), qsTrId("food-problems-anxiety"), qsTrId("food-problems-unsatisfied"), qsTrId("food-problems-disgusted"), qsTrId("food-problems-sad"), qsTrId("food-problems-stress")]
    property var questionTexts: [qsTrId("food-record-when"), qsTrId("food-record-where"), qsTrId("food-record-with"), qsTrId("food-record-what"), qsTrId("food-record-feel"), qsTrId("food-record-problems")]

    InputScrollView {
        id: view

        ColumnLayout {
            spacing: 5
            anchors.fill: parent
            id: questions

            DescriptionLabel {
                text: questionTexts[0]
                Layout.fillWidth: true
            }
            MenuTextArea {
                objectName: "input"
                Layout.fillWidth: true
            }

            LineDelimiter{}

            DescriptionLabel {
                text: questionTexts[1]
                Layout.fillWidth: true
            }
            MenuTextArea {
                objectName: "input"
                Layout.fillWidth: true
            }

            LineDelimiter{}

            DescriptionLabel {
                text: questionTexts[2]
                Layout.fillWidth: true
            }
            MenuTextArea {
                objectName: "input"
                Layout.fillWidth: true
            }

            LineDelimiter{}

            DescriptionLabel {
                text: questionTexts[3]
                Layout.fillWidth: true
            }
            MenuTextArea {
                objectName: "input"
                Layout.fillWidth: true
            }

            LineDelimiter{}

            DescriptionLabel {
                text: questionTexts[4]
                Layout.fillWidth: true
            }
            GridLayout{
                objectName: "ticks"
                columns: 2
                Layout.fillWidth: true
                Layout.leftMargin: 20

                Repeater{
                    model: feelItems
                        DescriptionLabel {
                            text: modelData
                            Layout.column: 0
                            Layout.row: index
                        }}
                Repeater{
                        model: feelItems
                        MenuCheckBox{
                            objectName: "tick"
                            Layout.column: 1
                            Layout.row: index
                        }
                }
            }
            DescriptionLabel {
                text: qsTrId("other")+":"
                Layout.fillWidth: true
            }
            MenuTextArea {
                objectName: "input"
                Layout.fillWidth: true
            }

            LineDelimiter{}

            DescriptionLabel {
                id: foodProblems
                text: questionTexts[5]
                Layout.fillWidth: true
            }
            GridLayout{
                objectName: "ticks"
                columns: 2
                Layout.fillWidth: true
                Layout.leftMargin: 20

                Repeater{
                    model: problemItems
                        DescriptionLabel {
                            text: modelData
                            Layout.column: 0
                            Layout.row: index
                        }}
                Repeater{
                        model: problemItems
                        MenuCheckBox{
                            objectName: "tick"
                            Layout.column: 1
                            Layout.row: index
                        }
                }
            }
            DescriptionLabel {
                text: qsTrId("other")+":"
                Layout.fillWidth: true
            }
            MenuTextArea {
                objectName: "input"
                Layout.fillWidth: true
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
