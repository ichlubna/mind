import QtQuick 2.4
import ".."

MenuPage {
    id: contactsPage
    property alias phoneButton: phoneButton
    property alias centerButton: centerButton
    property alias chatButton: chatButton
    title: qsTrId("contacts")

    MenuColumn {
        MenuButton {
            id: phoneButton
            text: qsTrId("phone")
        }

        MenuButton {
            id: centerButton
            text: qsTrId("center")
        }       

        MenuButton {
            id: chatButton
            text: qsTrId("chat")
        }     
    }
}
