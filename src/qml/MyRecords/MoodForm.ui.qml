import QtQuick
import QtCharts 2.3
import QtQuick.Controls
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
    property alias monthButton: monthButton
    property alias weekButton: weekButton
    property alias allButton: allButton

    title: titleText

    DescriptionLabel {
        id: moodText
        text: headerText
        anchors.bottomMargin: 10
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
                    function onClicked() {
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

    DescriptionLabel{
        id: daysText
        anchors.top: emoticonsRow.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        text: qsTrId("days")
    }

    MenuButton{
        id: weekButton
        width: parent.width*0.28
        anchors.left: parent.left
        anchors.top: daysText.bottom
        text: "7"
        enabled: length > 6
    }
    MenuButton{
        id: monthButton
        width: parent.width*0.28
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: daysText.bottom
        text: "30"
        enabled: length > 29
    }
    MenuButton{
        id: allButton
        width: parent.width*0.28
        anchors.right: parent.right
        anchors.top: daysText.bottom
        text: length
    }

    DescriptionLabel {
        id: noData
        text: qsTrId("mood-no-data")
        width: parent.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        horizontalAlignment: "AlignHCenter"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: !dataAvailable
    }

 /*   Column {
        id: legend
        //anchors.fill: parent
        anchors.top: parent.top
        //spacing: parent.height * 0.06
        height: parent.height
        width: parent.width
        Repeater{
            model: 5
            Image {
                source: "qrc:/images/emoticon"+(index+1)+".svg"
                fillMode: Image.PreserveAspectFit
                width: parent.width
                height: parent.height * 0.1
            }
        }
    }  */

    ChartView {
        id: chartView
        antialiasing: true
        backgroundColor: "transparent"
        legend.visible: false
        height: parent.height * 0.5
        width: parent.width
        visible: dataAvailable
        anchors.topMargin: 20
        anchors.top: weekButton.bottom

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
