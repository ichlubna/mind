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
            anchors.margins: 10
            Repeater {
                id: list
                anchors.fill: parent
                Item {
                    Layout.preferredWidth: view.width
                    Layout.preferredHeight: view.width * 0.5
                    Image {
                        width: parent.width
                        height: parent.height * 0.6
                        source: items[index * 2].trim()
                        fillMode: Image.PreserveAspectFit
                        anchors.top: parent.top
                    }
                    DescriptionLabel {
                        text: items[index * 2 + 1].trim()
                        height: parent.height * 0.3
                        width: parent.width
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignHCenter
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
