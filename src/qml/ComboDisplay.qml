import QtQuick
import QtQuick.Controls

MenuPage {
    MenuComboBox {
        id: list
        currentIndex: 0
        height: parent.height * 0.1
        onCurrentIndexChanged: {
            content.text = values[keys[list.currentIndex]]
        }
    }

    property var contentString

    ScrollView {
        width: parent.width
        height: parent.height * 0.9
        anchors.top: list.bottom
        contentWidth: -1
        clip: true
        Description {
            id: content
            text: contentString
        }
    }

    property var values
    property var keys

    Connections {
        target: content
        Component.onCompleted: {
            var text = contentString
            var textArray = text.split('|')
            values = []
            keys = []
            for (var i = 0; i < textArray.length; i++) {
                textArray[i] = textArray[i].trim()
                var location = textArray[i].substring(
                            4, textArray[i].indexOf("</h2>"))
                values[location] = textArray[i]
                keys[i] = location
            }
            list.model = keys
            content.text = values[keys[0]]
        }
    }
}
