import QtQuick 2.0
import QtQuick.Controls 2.12

MenuSeparator {
       padding: 0
       topPadding: 12
       bottomPadding: 12
       height: 25
       implicitWidth: parent.width*0.85
       anchors.horizontalCenter: parent.horizontalCenter
       contentItem: Rectangle {
           implicitHeight: 1
           implicitWidth: parent.width
           color: "#5EFFFFFF"
       }
   }
