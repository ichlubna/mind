import QtQuick
import QtQuick.Controls
import ".."

MenuPage {
    id: phonePage
    title: qsTrId("phone")

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
    Description {
        text: qsTrId("phone-text")
    }
    }
}
