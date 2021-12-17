import QtQuick
import QtCharts 2.3
import QtQuick.Controls 2.5
import Qt5Compat.GraphicalEffects
import ".."

MenuPage {
    id: moodPage
    property alias emoticons: emoticons
    property alias chart: chart
    property alias popup: popup
    property alias range: range
    property alias chartView: chartView
    property alias noData: noData

    title: titleText

    DescriptionLabel {
        id: moodText
        text: headerText
    }

    Row {
        id: emoticonsRow
        anchors.top: moodText.bottom
        width: parent.width
        height: parent.height * 0.2
        spacing: 5

        Repeater{
            id: emoticons
            model: 5
            Image {
                id: img
                source: "qrc:/images/emoticon"+(index+1)+".svg"
                fillMode: Image.PreserveAspectFit
                width: parent.width * 0.19
                height: parent.height
                opacity: 0.6
                MouseArea {
                    anchors.fill: parent

                    Connections {
                    onClicked: {
                        save(emoticons.count-index); emoticonAnim.start();}}
                }
                SequentialAnimation {
                    id: emoticonAnim
                    ScaleAnimator {
                            target: img
                            from: 1.0
                            to: 0.8
                            duration: 100
                    }
                    ScaleAnimator {
                            target: img
                            from: 0.8
                            to: 1.0
                            duration: 100
                    }}
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
        anchors.top: emoticonsRow.bottom

        Column {
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.1
            height: chartView.height
            spacing: parent.height * 0.06
            width: parent.width * 0.1
            Repeater{
                model: 5
                Image {
                    source: "qrc:/images/emoticon"+(index+1)+".svg"
                    fillMode: Image.PreserveAspectFit
                    width: parent.width
                    height: parent.height * 0.1
                }
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
