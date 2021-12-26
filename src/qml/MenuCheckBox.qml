import QtQuick
import QtQuick.Controls

CheckBox {
    indicator: Rectangle {
        implicitWidth: 30
        implicitHeight: 30
        radius: 3
        color: checked ? "#45000000" : "#15000000"
        border.width: 2
        border.color: "white"
        Image {
            anchors.fill: parent
            visible: checked
            source: "qrc:/images/tick.svg"
            fillMode: Image.PreserveAspectFit
        }
    }
}
