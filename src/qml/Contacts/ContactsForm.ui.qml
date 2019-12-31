import QtQuick 2.4
import ".."

MenuPage {
    id: contactsPage
    property alias phoneButton: phoneButton
    property alias centerButton: centerButton
    property alias chatButton: chatButton
    property alias universitiesButton: universitiesButton
    property alias myContactsButton: myContactsButton
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

        MenuButton {
            id: universitiesButton
            text: qsTrId("universities")
        }

        MenuButton {
            id: myContactsButton
            text: qsTrId("my-contacts")
        }
    }
}
