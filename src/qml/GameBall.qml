import QtQuick 2.0

Rectangle {
     height: parent.width*0.15
     width: height
     color: "red"
     radius: width*0.5
     MouseArea{
        anchors.fill: parent
     }
     opacity: 0.5
}
