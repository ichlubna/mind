import QtQuick 2.4
import QtQuick.Controls 2.12
import ".."

MenuPage {
    id: breath2Page
    property alias number: number
    property alias bar: bar
    property alias sprite: sprite
    property alias breathElement: breathElement
    property alias breathSlider: breathSlider
    title: qsTrId("breath") + " II"

    property int numberSize: 150

    Description {
        text: qsTrId("breathe-info")
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
    }

    Description {
        id: number
        text: "1"
        font.pointSize: numberSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Description {
           id: breathElement
           text: qsTrId("breathe-in")
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           opacity: 1.0
       }

    Rectangle {
        id: bar
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width

        height: parent.height * 0.05
        color: "White"
        opacity: 0.15
    }

    Image {
        id: sprite
        opacity: 0.1
        source: "qrc:/images/circle.svg"
        fillMode: Image.PreserveAspectFit
        width: (parent.width < parent.height) ? parent.width - 100 : parent.height - 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    MenuSlider {
        id: breathSlider
        to: 1.3
        from: 0.7
        anchors.bottom: bar.top
    }

    DescriptionLabel{
        text: qsTrId("breathe-slider")
        anchors.bottom: breathSlider.top
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
    }
}

