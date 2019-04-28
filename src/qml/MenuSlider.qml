import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Slider {
    value: 1.0
    anchors.bottomMargin: 10
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width * 0.7
    style: SliderStyle {
            groove: Rectangle {
                implicitHeight: 4
                color: "#ec63ff"
                radius: 8
                opacity: 0.5
            }
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "white" : "#e5b8fc"
                opacity: 0.8
                border.color: "white"
                border.width: 2
                implicitWidth: 34
                implicitHeight: 34
                radius: width * 0.5
            }
        }
}
