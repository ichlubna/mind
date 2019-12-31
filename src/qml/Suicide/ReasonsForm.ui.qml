import QtQuick 2.4
import io.qt.UserDataProvider 1.0
import ".."

ArrayUpdater {
    title: qsTrId("reasons")
    arrayNames: ["reasons"]
    headerText: qsTrId("reasons-text")
}

/*
MenuPage {
    id: reasonsPage
    property alias myReasons: myReasons
    title: qsTrId("reasons")

   Description {
        id: reasonsText
        text: qsTrId("reasons-text")
    }

    MenuTextArea {
        id: myReasons
        anchors.horizontalCenter: reasonsText.horizontalCenter
        anchors.top: parent.top
        width: reasonsText.width
        anchors.topMargin: reasonsText.paintedHeight
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

}

*/
