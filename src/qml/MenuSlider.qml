import QtQuick 2.14
import QtQuick.Controls 2.12

Slider {
    value: 1.0
    stepSize: 0.025
    anchors.bottomMargin: 10
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width * 0.7
    background: Rectangle {
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.0
                color: "#05ffffff"
            }
            GradientStop {
                position: 0.5
                color: "#aaffffff"
            }
            GradientStop {
                position: 1.0
                color: "#05ffffff"
            }
        }
        radius: 8
        opacity: 0.5
    }
   handle: Rectangle {
        x: leftPadding + visualPosition * (availableWidth - width)
        y: topPadding + availableHeight / 2 - height / 2
        property var sizeIdle: 30
        color: pressed ? "white" : "#e5e5e5"
        opacity: 0.8
        border.color: "white"
        border.width: 1
        implicitWidth: sizeIdle
        implicitHeight: sizeIdle
        radius: width * 0.5
    }
}
