import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Popup {
    property alias yes: yes
    property alias no: no
    property alias msg: msg

    id: popup
    parent: Overlay.overlay
    width: parent.width
    height: parent.height * 0.5
    anchors.centerIn: parent
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    bottomPadding: 0
    topPadding: 0
    leftPadding: 0
    rightPadding: 0
    modal: true
    background: Image {
        id: popupBckg
        source: "qrc:/images/backgroundPopup.svg"
        smooth: true
        antialiasing: true
        visible: false
    }
    Colorize {
        anchors.fill: parent
        source: popupBckg
        hue: ThemeInfo.hueValue
        saturation: 0.7
        lightness: ThemeInfo.backgroundLightness - ThemeInfo.elementSubtractor
        opacity: 0.5
    }

    Description {
        id: msg
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
        width: parent.width
    }

    MenuButton {
        id: yes
        text: qsTrId("mood-help-yes")
        anchors.bottom: no.top
        width: parent.width* 0.6
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
    MenuButton {
        id: no
        text: qsTrId("mood-help-no")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        width: parent.width* 0.6
        anchors.horizontalCenter: parent.horizontalCenter
    }

    onOpened: {showBlur();}
    onClosed: {hideBlur();}
}
