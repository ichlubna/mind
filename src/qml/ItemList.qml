import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

MenuPage {
    property var items: []
    property var contentString

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
        id: view

        ColumnLayout {
            anchors.fill: parent
            Repeater {
                id: list
                Layout.fillHeight: true
                Layout.fillWidth: true
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: view.width
                    Image {
                        id: img
                        width: parent.width
                        height: parent.height * 0.6
                        source: items[index * 2].trim()
                        fillMode: Image.PreserveAspectFit
                        anchors.top: parent.top
                        anchors.topMargin: 5
                    }
                    Shadow{
                        source: img
                        anchors.fill: img}
                    DescriptionLabel {
                        id: description
                        text: items[index * 2 + 1].trim()
                        height: parent.height * 0.3
                        width: parent.width
                        anchors.top: img.bottom
                        anchors.topMargin: 10
                        horizontalAlignment: Text.AlignHCenter
                    }

                    LineDelimiter{
                        width: parent.width
                        height: 20
                        anchors.top: description.bottom
                    }
                }
            }
        }
    }

    Connections {
        target: list
        Component.onCompleted: {
            items = contentString.split('|')
            list.model = items.length / 2
        }
    }
}
