import QtQuick
import QtQuick.Controls
import ".."

MenuPage {
    id: centerPage
    title: qsTrId("aboutApp")

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
        Description {
            id: centerText
            text: qsTrId("aboutApp-text")
        }
    }
}
