import QtQuick 2.4
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import ".."

MenuPage {
    id: importExportPage
    property alias importButton: importButton
    property alias exportButton: exportButton
    property alias fileDialog: fileDialog
    property alias anim: anim
    title: qsTrId("import-export")

    Image {
            id: anim
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            opacity: 0.0
            z: 10
    }

    Description {
        id: importExportText
        text: qsTrId("import-export-text")
        anchors.top: parent.top
    }

    MenuButton {
        id: importButton
        text: qsTrId("import-button")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: exportButton.top
        anchors.margins: 20
        width: parent.width*0.6
    }

    MenuButton {
        id: exportButton
        text: qsTrId("export-button")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 20
        width: parent.width*0.6
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
    }
}
