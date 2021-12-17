import QtQuick
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "."

MenuPage {
    id: planPage
    property alias itemList: itemList
    title: qsTrId("plan")

    InputScrollView {
        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            Repeater {
                id: itemList
                model: questions
                Item {
                    Layout.row: index
                    Layout.fillWidth: true
                    Layout.preferredHeight: (label.height + area.height) * 1.05
                    DescriptionLabel {
                        id: label
                        width: parent.width
                        text: questions[index]
                    }
                    MenuTextArea {
                        id: area
                        width: parent.width
                        anchors.top: label.bottom
                    }
                }
            }
        }
    }
}

