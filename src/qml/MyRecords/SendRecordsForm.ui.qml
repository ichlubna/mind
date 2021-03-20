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
    property alias message: message
    title: qsTrId("sendRecords")

    InputScrollView{

    ColumnLayout{
        anchors.fill: parent
        spacing: 15
        Description{
            //text: qsTrId("sendRecords-text")
            text: "Tato služba je dočasně nedostupná!"
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height*0.2
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

        Description{
            id: rangeText
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height*0.1
            anchors.fill: undefined
            horizontalAlignment: Text.AlignHCenter
        }

        MenuComboBox{
            id: choice
            Layout.fillWidth: true
            model: ["brno@anabell.cz", "praha@anabell.cz", "ostrava@anabell.cz", qsTrId("other")]
            Layout.preferredHeight: parent.height*0.17
        }

        MenuTextArea{
            id: email
            Layout.fillWidth: true
            visible: (choice.count-1 == choice.currentIndex)
        }

        MenuTextArea{
            id: message
            text: qsTrId("custom-message")
            Layout.fillWidth: true
        }

        MenuButton{
            id: sendButton
            text: qsTrId("send")
            Layout.fillWidth: true
            enabled: false
            opacity: 0.35
        }
    }
    }
}
