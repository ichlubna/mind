import QtQuick
import QtQuick.Controls
import ".."

MenuPage {
    property alias viewText: viewText
    property alias copyButton: copyButton
    id: viewPage
    title: qsTrId("view-data")

    MenuButton {
        text: qsTrId("copy")
        anchors.horizontalCenter: parent.horizontalCenter
        id: copyButton
        width: parent.width/2
        anchors.topMargin: 10
    }

    ScrollView {
        anchors.top: copyButton.bottom
        anchors.topMargin: 10
        width: parent.width
        height: parent.height-copyButton.height-20
        contentWidth: -1
        clip: true
        MenuTextArea {
            id: viewText
            readOnly: true
            selectByMouse: true
          }
        }
}

