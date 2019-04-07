import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

CheckBox {
        style: CheckBoxStyle {
               indicator: Rectangle {
                       implicitWidth: 25
                       implicitHeight: 25
                       radius: 3
                       border.color: control.activeFocus ? "darkblue" : "gray"
                       border.width: 1
                       Rectangle {
                           visible: control.checked
                           color: "#555"
                           border.color: "#333"
                           radius: 10
                           anchors.margins: 4
                           anchors.fill: parent
                       }
               }
        }
}
