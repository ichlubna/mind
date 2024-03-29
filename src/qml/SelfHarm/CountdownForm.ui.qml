import QtQuick
import QtQuick.Layouts
import ".."

SwipePage {
    property alias button: button
    property alias currentTime : currentTime
    property alias recordTime: recordTime
    property alias popup: popup
    property alias popupHelp: popupHelp


    title: qsTrId("self-harm-timer")

    InputScrollView{
    ColumnLayout{
        anchors.margins: 25
        anchors.fill: parent

        CountdownResult{
            id: currentTime
        }

        MenuButton{
            id: button
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width*0.6
        }

        LineDelimiter{
            width: parent.width
        }

        DescriptionLabel{
            text: qsTrId("self-harm-record")
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
        }
        CountdownResult{
            id: recordTime
            opacity: 0.5
        }
    }}

    PopupWindow {
        id: popup
        msg.text: qsTrId("really-stop-timer")
    }

    PopupWindow {
        id: popupHelp
        msg.text: qsTrId("need-help")
    }
}
