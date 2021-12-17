import QtQuick
import ".."

MenuPage {
    id: chatPage
    property alias chatText: chatText
    title: qsTrId("chat")

    Description {
        id: chatText
        text: qsTrId("chat-text")
        horizontalAlignment: Text.AlignHCenter
    }
}


