import QtQuick
import QtQuick.Controls

Tumbler {
    property var incrementItems: true
    id: dayTumbler
    visibleItemCount: 5.0
    width: parent.width*0.3
    delegate:
          Text {
           text: (incrementItems) ? modelData + 1 : modelData
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           opacity: 1.0 - Math.abs(Tumbler.displacement) / (visibleItemCount / 2)
           color: "white"
           font.pointSize: Math.max(5, parent.width*0.2*(1.0-Math.abs(Tumbler.displacement) / (visibleItemCount / 2)))
    }
 }
