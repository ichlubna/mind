import QtQuick 2.4

MenuPage {
    id: chatPage
    property alias chatText: chatText
    title: qsTrId("chat")

    Description {
        id: chatText
        text: qsTrId("chat-text")
    }
}


