import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

MenuPage {
    property alias sourceList: sourceList

    id: sources
    title: qsTrId("sources")

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
        id: view

        ColumnLayout {
            anchors.fill: parent
            spacing: 20

            Repeater {
                Layout.fillHeight: true
                Layout.fillWidth: true
                id: sourceList
                model: 0

                DescriptionLabel {
                    Layout.fillWidth: true
                    Layout.minimumHeight: 100
                }
            }
        }
    }
}
