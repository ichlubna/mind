import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

MenuPage {
    property var listInputText: ""
    property variant items: []

    SwipeView {
        anchors.fill: parent
        Repeater {
            id: itemsContainer
            model: items.length
            Item {
                id: delegate

            ScrollView {
                anchors.fill: parent
                contentWidth: -1
                clip: true

                Description {
                    id: textElement
                    text: "<br><br>"+items[index].trim()
                    Image {
                            source: "qrc:/images/arrow.svg"
                            fillMode: Image.PreserveAspectFit
                        anchors.left: parent.left
                        height: 2*textElement.font.pointSize
                    }
                     Image {
                            source: "qrc:/images/arrow.svg"
                            fillMode: Image.PreserveAspectFit
                            rotation: 180
                        anchors.right: parent.right
                        height: 2*textElement.font.pointSize
                    }
                }}
            }
}
        Connections {
            target: itemsContainer
            Component.onCompleted: {
                items = listInputText.split('|')
               }
        }
}
}
