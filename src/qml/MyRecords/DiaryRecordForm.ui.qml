import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import ".."

SwipePage{
    property alias view: view
    property alias recordDate: recordDate
    property alias recordText: recordText
        title: qsTrId("diary")


        ScrollView {
            id: view
            anchors.fill: parent
            contentWidth: -1
            clip: true
            anchors.margins: 10

        ColumnLayout{
            spacing: 10
            anchors.fill: parent

        Item{
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: view.height*0.1
        DatePicker {
            id: recordDate
            width: parent.width*0.8
            height: parent.height
            anchors.left: parent.left
        }

        Image {
            source: "qrc:/images/delete.svg"
            height: view.height*0.1
            width: view.height*0.1
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            MouseArea {
                anchors.fill: parent
                Connections {
                    onClicked: {
                        remove()
                    }
                }
            }
        }}

        MenuTextArea{
            id: recordText
            Layout.preferredWidth: parent.width
        }
}}}
