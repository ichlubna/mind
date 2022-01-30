import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

MenuPage {
    property alias addButton: addButton
    property alias sendArea: sendArea
    property alias records: records
    property alias viewContainer: viewContainer
    property alias dateText: dateText
    property alias rightButton: rightButton
    property alias leftButton: leftButton
    property real col1Ratio: 0.3
    property real col2Ratio: 0.7
    title: titleText
    id: viewContainer

    DescriptionLabel{
        id: dateText
        anchors.top: parent.top
        height: font.pointSize*2
        width: parent.width*0.5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:  Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: leftButton
        background: Image {
            source: "qrc:/images/arrow.svg"
            fillMode: Image.PreserveAspectFit
        }
        anchors.left: parent.left
        anchors.verticalCenter: dateText.verticalCenter
        width: parent.width * 0.1
        height: dateText.height
    }

    Button {
        id: rightButton
        background: Image {
            source: "qrc:/images/arrow.svg"
            fillMode: Image.PreserveAspectFit
            rotation: 180
        }
        anchors.right: parent.right
        anchors.verticalCenter: dateText.verticalCenter
        width: parent.width * 0.1
        height: dateText.height
    }

    ScrollView {
        anchors.top: dateText.bottom
        width: parent.width
        height: parent.height-dateText.height
        clip: true
        contentWidth: column.width
        contentHeight: column.height

        Column {
            id: column
            Repeater {
                id: records
                Item {
                    property bool header: false
                    property string date: ""
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
                        visible: dateOnly && arrayNames.length > 1
                        Repeater{
                            model: 6
                            Image {
                                property var ok: false
                                source: (ok) ? "qrc:/images/tick.svg" : "qrc:/images/delete.svg"
                                height: parent.height*0.23
                                width: parent.height*0.23
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
                            function onClicked() {
                                stackView.push(afterDateFile, {"date": date, "arrayNames" : arrayNames, "questionTexts" : questionTexts, "titleText" : titleText})
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
            height: 60
            width: 90
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 5
            fillMode: Image.PreserveAspectFit
            opacity: 0.5
            MouseArea {
                anchors.fill: parent
                id: sendArea
            }
            visible: sendingEnabled
        }
}
