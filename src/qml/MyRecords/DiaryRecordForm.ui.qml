import QtQuick 2.9
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import ".."

SwipePage{
    property alias view: view
    property alias recordText: recordText
    property alias removeArea: removeArea
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

        Image {
            source: "qrc:/images/delete.svg"
            height: view.height*0.1
            width: view.height*0.1
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            MouseArea {
                anchors.fill: parent
                id: removeArea
            }
        }}

        MenuTextArea{
            id: recordText
            Layout.preferredWidth: parent.width
        }
}}}
