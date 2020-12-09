import QtQuick 2.14
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
                //color: "white"
                gradient: Gradient {
                               orientation: Gradient.Horizontal;
                               GradientStop { position: 0.0; color: "#20ffffff" }
                               GradientStop { position: 0.5; color: "#ffffffff" }
                               GradientStop { position: 1.0; color: "#20ffffff" }
                           }
                radius: 8
                opacity: 0.5
            }
            handle: Rectangle {
                property var sizeIdle : 30
                anchors.centerIn: parent
                color: control.pressed ? "white" : "#e5e5e5"
                opacity: 0.8
                border.color: "white"
                border.width: 1
                implicitWidth: sizeIdle
                implicitHeight: sizeIdle
                radius: width * 0.5
            }
        }
}
