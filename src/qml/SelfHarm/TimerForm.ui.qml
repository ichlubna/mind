import QtQuick 2.4
import QtQuick.Layouts 1.3
import ".."

SwipePage {
    property alias timeText: timeText
    property alias button: button
    property alias recordText: recordText

    title: qsTrId("self-harm-timer")

    ColumnLayout{
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.8
        anchors.topMargin: 10

        DescriptionLabel{
            id: timeText
            width: parent.width
            Layout.alignment: Qt.AlignHCenter
            font.pointSize: 30
        }
        MenuButton{
            id: button
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width*0.6
        }

        DescriptionLabel{
            text: qsTrId("self-harm-record")
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
        }
        DescriptionLabel{
            id: recordText
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
