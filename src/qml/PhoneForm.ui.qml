import QtQuick 2.4
import QtQuick.Controls 2.5

MenuPage {
    id: phonePage
    property alias phoneText: phoneText
    title: qsTrId("phone")

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
    Description {
        id: phoneText
        text: qsTrId("phone-text")
    }
    }
}
