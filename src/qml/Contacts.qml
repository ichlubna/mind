import QtQuick 2.4

ContactsForm {
    phoneButton.onClicked: stackView.push("Phone.qml")
    centerButton.onClicked: stackView.push("Center.qml")
    chatButton.onClicked: stackView.push("Chat.qml")
}
