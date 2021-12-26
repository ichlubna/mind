import QtQuick
import QtQuick.Layouts 1.3
import ".."

Item{
    property alias monthText: monthText
    property alias daysBar: daysBar
    property alias hoursBar: hoursBar
    property alias minutesBar: minutesBar
    Layout.preferredWidth: parent.width
    Layout.preferredHeight: (daysBar.height + labelText.height + monthLabel.height + monthText.height)*1.2
    Layout.alignment: Qt.AlignHCenter

    DescriptionLabel{
        id: monthText
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 30
    }

    DescriptionLabel{
        id: monthLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: monthText.bottom
        text: qsTrId("months")
    }

    CircularProgressBar{
        id: daysBar
        anchors.left: parent.left
        anchors.top: monthLabel.bottom
        anchors.topMargin: 10
        max: 30
    }
    DescriptionLabel{
        id: labelText
        anchors.top: daysBar.bottom
        anchors.horizontalCenter: daysBar.horizontalCenter
        text: qsTrId("days")
    }

    CircularProgressBar{
        id: hoursBar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: monthLabel.bottom
        anchors.topMargin: 10
        max: 24
    }
    DescriptionLabel{
        anchors.top: hoursBar.bottom
        anchors.horizontalCenter: hoursBar.horizontalCenter
        text: qsTrId("hours")
    }

    CircularProgressBar{
        id: minutesBar
        anchors.right: parent.right
        anchors.top: monthLabel.bottom
        anchors.topMargin: 10
        max: 60
    }
    DescriptionLabel{
        anchors.top: minutesBar.bottom
        anchors.horizontalCenter: minutesBar.horizontalCenter
        text: qsTrId("minutes")
    }
}
