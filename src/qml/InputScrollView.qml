import QtQuick
import QtQuick.Controls

ScrollView {
    anchors.fill: parent
    contentWidth: -1
    clip: true
    anchors.margins: 10
    TapHandler { onTapped: outFocuser.forceActiveFocus();}
}
