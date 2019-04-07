import QtQuick 2.4
import QtQuick.Controls 2.5

MenuPage {
    id: centerPage
    title: qsTrId("center")

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
        Description {
            id: centerText
            text: qsTrId("center-text")
        }
    }
}
