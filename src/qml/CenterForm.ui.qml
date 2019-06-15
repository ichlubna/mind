import QtQuick 2.4
import QtQuick.Controls 2.5

MenuPage {
    property alias centerText: centerText
    property alias list: list
    id: centerPage
    title: qsTrId("center")

    MenuComboBox {
        id: list
        currentIndex: 0
        height: parent.height*0.1
    }

    ScrollView {
        width: parent.width
        height: parent.height*0.9
        anchors.top: list.bottom
        contentWidth: -1
        clip: true
        Description {
            id: centerText
            text: qsTrId("center-text")
        }
    }
}

