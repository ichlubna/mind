import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

CheckBox {
        style: CheckBoxStyle {
               indicator: Rectangle {
                       implicitWidth: 30
                       implicitHeight: 30
                       radius: 3
                       color: control.checked ? "#45000000" : "#15000000"
                       border.width: 2
                       border.color: "white"
                       Image {
                           anchors.fill: parent
                           visible: control.checked
                              source: "qrc:/images/tick.svg"
                              fillMode: Image.PreserveAspectFit
                                  }

               }
        }
}
