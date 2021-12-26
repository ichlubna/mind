import QtQuick
import QtQuick.Controls
import ".."

MenuPage {
    id: foodContactPage
    title: qsTrId("food-contact")

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
    Description {
        text: qsTrId("food-contact-text")
        font.pointSize: 30
    }
    }
}
