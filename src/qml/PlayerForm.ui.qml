import QtQuick 2.4
import QtMultimedia 5.12
import QtQuick.Controls 2.2

SwipePage {
    property var file: ""
    property var titleText: ""

    property alias playButton: playButton
    property alias mediaPlayer: mediaPlayer
    property alias bckg: bckg
    property alias timeText: timeText
    property alias timeSlider: timeSlider
    title: titleText

    MediaPlayer {
           id: mediaPlayer
           source: file
    }

    DescriptionLabel{
        id: timeText
        anchors.bottom: playButton.top
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: parent.width*0.05
    }

    ToolButton {
        id: playButton
        background:
            Rectangle{
            anchors.fill: parent
            border.color: "#0AFFFFFF"
            border.width: 20
            radius: width*0.2
            color: "transparent"
                Image {
                id: bckg
                width: parent.width*0.5
                height: parent.height*0.5
                source: "qrc:/images/play.svg"
                fillMode: Image.PreserveAspectFit
                opacity: 0.7
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                }
        }
        height: parent.width*0.8
        width: parent.width*0.8
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MenuSlider{
        id: timeSlider
        anchors.top: playButton.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
    }

    property alias warning: warning
    Description{
        id: warning
        text: ("Upozorňujeme,že relaxácia je v českom jazyku!")
        anchors.top: timeSlider.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignBottom
        visible: false
        font.pointSize: 15
    }
}
