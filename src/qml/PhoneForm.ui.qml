import QtQuick 2.4

MenuPage {
    id: phonePage
    property alias phoneText: phoneText
    title: qsTrId("phone")

    Description {
        id: phoneText
        text: qsTrId("phone-text")
    }
}
