import QtQuick 2.12
import QtQuick.Controls 2.12

Tumbler {
    property var incrementItems: true
    id: dayTumbler
    visibleItemCount: 3
    delegate: Text {
           text: (incrementItems) ? modelData + 1 : modelData
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           opacity: 0.4 + Math.max(0, 1 - Math.abs(Tumbler.displacement)) * 0.6
           color: "white"
    }
 }
