import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Enterprise.Controls.Styles 1.0

Tumbler {
    property var incrementItems: true
    id: dayTumbler
    visibleItemCount: 5
    width: parent.width*0.3
    delegate:
          Text {
           text: (incrementItems) ? modelData + 1 : modelData
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           opacity: 1.0 - Math.abs(Tumbler.displacement) / (visibleItemCount / 2)
           color: "white"
           font.pointSize: parent.width*0.2*(1.0-Math.abs(Tumbler.displacement) / (visibleItemCount / 2))
    }
 }
