import QtQuick 2.4
import QtCharts 2.3
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import ".."

MenuPage {
    id: moodPage
    property alias emoticon1Img: emoticon1Img
    property alias emoticon2Img: emoticon2Img
    property alias emoticon3Img: emoticon3Img
    property alias emoticon4Img: emoticon4Img
    property alias emoticon5Img: emoticon5Img
    property alias emoticon1: emoticon1
    property alias emoticon2: emoticon2
    property alias emoticon3: emoticon3
    property alias emoticon4: emoticon4
    property alias emoticon5: emoticon5
    property alias chart: chart
    property alias popup: popup
    property alias range: range
    property alias chartView: chartView
    property alias noData: noData

    title: qsTrId("depression-mood")

    DescriptionLabel {
        id: moodText
        text: qsTrId("mood-text")
    }

    Row {
        // anchors.margins: 5
        id: emoticons
        anchors.top: moodText.bottom
        width: parent.width
        height: parent.height * 0.2
        spacing: 5
        Image {
            id: emoticon1Img
            source: "qrc:/images/emoticon1.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.19
            height: parent.height
            opacity: 0.6
            MouseArea {
                id: emoticon1
                anchors.fill: parent
            }
        }
        Image {
            id: emoticon2Img
            source: "qrc:/images/emoticon2.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.19
            height: parent.height
            opacity: 0.6
            MouseArea {
                id: emoticon2
                anchors.fill: parent
            }
        }
        Image {
            id: emoticon3Img
            source: "qrc:/images/emoticon3.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.19
            height: parent.height
            opacity: 0.6
            MouseArea {
                id: emoticon3
                anchors.fill: parent
            }
        }
        Image {
            id: emoticon4Img
            source: "qrc:/images/emoticon4.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.19
            height: parent.height
            opacity: 0.6
            MouseArea {
                id: emoticon4
                anchors.fill: parent
            }
        }
        Image {
            id: emoticon5Img
            source: "qrc:/images/emoticon5.svg"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.19
            height: parent.height
            opacity: 0.6
            MouseArea {
                id: emoticon5
                anchors.fill: parent
            }
        }
    }

    DescriptionLabel {
        id: noData
        text: qsTrId("mood-no-data")
        width: parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        horizontalAlignment: "AlignHCenter"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false
    }

    ChartView {
        id: chartView
        antialiasing: true
        backgroundColor: "transparent"
        legend.visible: false
        height: parent.height * 0.7
        width: parent.width
        visible: false
        anchors.top: emoticons.bottom

        Column {
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.1
            height: chartView.height
            spacing: parent.height * 0.06
            width: parent.width * 0.1
            Image {
                source: "qrc:/images/emoticon1.svg"
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height * 0.1
            }
            Image {
                source: "qrc:/images/emoticon2.svg"
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height * 0.1
            }
            Image {
                source: "qrc:/images/emoticon3.svg"
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height * 0.1
            }
            Image {
                source: "qrc:/images/emoticon4.svg"
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height * 0.1
            }
            Image {
                source: "qrc:/images/emoticon5.svg"
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height * 0.1
            }
        }
        LineSeries {
            id: chart
            width: 5
            color: "white"
            axisX: DateTimeAxis {
                labelsColor: "white"
                tickCount: 2
                format: "dd.MM.yy"
            }
            axisY: ValueAxis {
                min: 1
                max: 5
                labelsVisible: false
            }
        }
    }

    RangeSlider {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height * 0.1
        width: parent.width * 0.9
        id: range
        from: 0
        to: 1
        stepSize: 1
        snapMode: RangeSlider.SnapAlways
        first.value: 0
        second.value: 1
    }

    PopupWindow{
        id: popup
        msg.text: qsTrId("mood-help")
    }

}
