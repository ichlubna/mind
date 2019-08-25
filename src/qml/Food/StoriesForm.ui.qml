import QtQuick 2.4
import QtQuick.Controls 2.5
import ".."

MenuPage {
    id: storiesPage
    title: qsTrId("food-stories")

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
        Description {
            text: qsTrId("food-stories-text")
        }
    }
}
