import QtQuick 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.14
import ".."

SwipePage {
    property alias choice: choice
    property alias email: email
    property alias rangeText: rangeText
    property alias slider: slider
    property alias sendButton: sendButton
    title: qsTrId("sendRecords")

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 10
        Description{
            text: qsTrId("sendRecords-text")
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height*0.15
            anchors.fill: undefined
        }

        Description{
            id: rangeText
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height*0.15
            anchors.fill: undefined
        }

        RangeSlider {
            from: 0
            stepSize: 1
            snapMode: RangeSlider.SnapAlways
            first.value: 0
            id: slider
            Layout.fillWidth: true
        }

        MenuComboBox{
            id: choice
            Layout.fillWidth: true
            model: ["brno@anabell.cz", "praha@anabell.cz", "ostrava@anabell.cz", qsTrId("custom")]
            Layout.preferredHeight: parent.height*0.1
        }

        MenuTextArea{
            id: email
            Layout.fillWidth: true
            visible: (choice.count-1 == choice.currentIndex)
        }

        MenuButton{
            id: sendButton
            text: qsTrId("send")
            Layout.fillWidth: true
        }
    }
}
