import QtQuick 2.14
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "."

MenuPage {
    property alias addButton: addButton
    property alias itemList: itemList
    property alias itemListC: itemListC
    property alias itemListR: itemListR
    property alias viewContainer: viewContainer
    property var col1WRatio: 0.05
    property var col3WRatio: 0.05
    property var colHRatioM: 1
    property var colHRatio: 0.15 * colHRatioM
    property var twoInputs: false
    title: titleText

    Description {
        id: planHeader
        text: headerText
    }

    InputScrollView {
        id: viewContainer
        anchors.topMargin: planHeader.paintedHeight + 20

        GridLayout {
            anchors.fill: parent
            columns: (type === "L") ? 2 : 3
            rowSpacing: 10

            Repeater {
                id: itemListC
                model: 0
                Item {
                    Layout.row: index
                    Layout.column: 0
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.preferredWidth: parent.width * col1WRatio
                    Layout.preferredHeight: parent.width * colHRatio
                    MenuCheckBox {
                        width: parent.width
                        height: parent.height
                        visible: !twoInputs
                    }
                    Image {
                        source: "qrc:/images/phone.svg"
                        width: parent.width
                        fillMode: Image.PreserveAspectFit
                        visible: twoInputs
                        anchors.bottom: parent.verticalCenter
                        anchors.bottomMargin: parent.height * 0.05
                        MouseArea {
                            anchors.fill: parent
                            Connections {
                                onClicked: {
                                    call(index)
                                }
                            }
                        }
                    }
                    Image {
                        source: "qrc:/images/sms.svg"
                        width: parent.width
                        fillMode: Image.PreserveAspectFit
                        visible: twoInputs
                        anchors.top: parent.verticalCenter
                        anchors.topMargin: parent.height * 0.05
                        MouseArea {
                            anchors.fill: parent
                            Connections {
                                onClicked: {
                                    sms(index)
                                }
                            }
                        }
                    }
                }
            }

            Repeater {
                id: itemList
                model: 0
                Item {
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: (twoInputs) ? text1.height+text2.height : text1.height
                    Layout.row: index
                    Layout.column: (type === "L") ? 0 : 1
                    Layout.fillWidth: true
                    MenuTextArea {
                        id: text1
                        width: parent.width
                        anchors.top: parent.top
                    }
                    MenuTextArea {
                        id: text2
                        width: parent.width
                        anchors.bottom: parent.bottom
                        visible: twoInputs
                        Connections {
                        onTextChanged: checkContact(index)}
                    }
                }
            }

            Repeater {
                id: itemListR
                model: 0
                Image {
                    source: "qrc:/images/delete.svg"
                    Layout.preferredWidth: parent.width * col3WRatio
                    Layout.preferredHeight: parent.width * col3WRatio
                    Layout.row: index
                    Layout.column: (type === "L") ? 1 : 2
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
                height: 300
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



