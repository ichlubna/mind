import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("contacts")
    items: [{text: qsTrId("phone"), file: "Contacts/Phone.qml"},
            {text: qsTrId("center"), file: "Contacts/Center.qml", excluded: ["IT", "ES"]},
            {text: qsTrId("chat"), file: "Contacts/Chat.qml", excluded: ["FR", "PL", "ES"]},
            {text: qsTrId("universities"), file: "Contacts/Universities.qml", excluded: ["FR", "PL", "ES", "SK", "PL", "IT", "EN"]},
            {text: qsTrId("my-contacts"), file: "Contacts/MyContacts.qml"}
            ]
}
