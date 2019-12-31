import QtQuick 2.4
import io.qt.UserDataProvider 1.0

ContactsForm {
    phoneButton.onClicked: stackView.push("Phone.qml")
    centerButton.onClicked: stackView.push("Center.qml")
    chatButton.onClicked: stackView.push("Chat.qml")
    universitiesButton.onClicked: stackView.push("Universities.qml")
    myContactsButton.onClicked: stackView.push("MyContacts.qml")

    UserDataProvider {
        id: dataProvider
    }

    Connections {
        target: chatButton
        Component.onCompleted: {
            if(dataProvider.loadLanguage() === "FR" || dataProvider.loadLanguage() === "PL")
                chatButton.visible = false;
        }
    }
    Connections {
        target: universitiesButton
        Component.onCompleted: {
            if(dataProvider.loadLanguage() !== "CZ")
                chatButton.visible = false;
        }
    }
}
