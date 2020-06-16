import QtQuick 2.14
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import io.qt.NativeInterface 1.0

ToolBar {
    NativeInterface {
        id: nativeInterface
    }

        contentHeight: backButton.implicitHeight
        background: Rectangle {
            color: "#9a9a9a"
            id: barBckg
            visible: false
        }

        height: 40
        font.pointSize: 14
        Colorize {
            id: headerColor
            anchors.fill: parent
            source: barBckg
            hue: ThemeInfo.hueValue
            saturation: 0.6
            lightness: ThemeInfo.backgroundLightness - ThemeInfo.elementSubtractor
        }

        Shadow {
              anchors.fill: headerColor
              source: headerColor
            }

        ToolButton {
            id: backButton
            background: Image {
                source: stackView.depth > 1 ? "qrc:/images/back.svg" : "qrc:/images/exit.svg"
                fillMode: Image.PreserveAspectFit
            }
            height: parent.height
            width: parent.width / 17
            anchors.leftMargin: parent.width / 50
            anchors.left: parent.left
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else
                    Qt.quit()
            }
        }

        ToolButton {
            id: settingsButton
            background: Image {
                source: "qrc:/images/gear.svg"
                fillMode: Image.PreserveAspectFit
            }
            height: parent.height
            width: parent.width / 17
            onClicked: drawer.open()
            anchors.right: parent.right
            anchors.rightMargin: parent.width / 50
        }

        ToolButton {
            property var notificationsOn: dataProvider.loadBoolInput("notificationsOn")
            id: bellButton
            background: Image {
                source: "qrc:/images/bell.svg"
                fillMode: Image.PreserveAspectFit
            }
            height: parent.height
            width: parent.width / 17
            anchors.right: settingsButton.left
            anchors.rightMargin: parent.width / 50
            opacity: (notificationsOn) ? 0.8 : 0.2
            onClicked: {notificationsOn = !notificationsOn; dataProvider.saveBoolInput("notificationsOn", notificationsOn); nativeInterface.updateNotifications(qsTrId("notification-title"), qsTrId("notification-msg"), notificationsOn);}
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
            color: "White"
        }
    }
