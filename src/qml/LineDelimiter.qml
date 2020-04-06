import QtQuick 2.14
import QtQuick.Layouts 1.3

Rectangle {
    Layout.fillWidth: true
    height: 20
    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: "#00FFFFFF" }
        GradientStop { position: 0.5; color: "#25FFFFFF" }
        GradientStop { position: 1.0; color: "#00FFFFFF" }
    }
    Layout.topMargin: 15
    Layout.bottomMargin: 15
}
