import QtQuick 2.9
import QtQuick.Controls 2.2
import io.qt.UserDataProvider 1.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTrId("appName")
    onClosing:{ if (stackView.depth > 1) {
                   close.accepted = false
                   stackView.pop()
               }
               else
                   return
           }

    header: ToolBar {
        contentHeight: backButton.implicitHeight
        background:  Rectangle {
            color: "#612f8f"
        }
        height: 40

        ToolButton {
            id: backButton
            background: Image{
                source: stackView.depth > 1 ? "qrc:/images/back.svg" : "qrc:/images/exit.svg"
                fillMode: Image.PreserveAspectFit
            }
            height: parent.height
            width: parent.width/17
            anchors.leftMargin: parent.width/50
            anchors.left: parent.left
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                }
                else
                    Qt.quit()
            }
        }

        ToolButton {
            id: settingsButton
            background: Image{
                source: "qrc:/images/gear.svg"
                fillMode: Image.PreserveAspectFit
            }
            height: parent.height
            width: parent.width/17
            onClicked: drawer.open()
            anchors.right: parent.right
            anchors.rightMargin: parent.width/50
       }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
            color: "White"
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height
        background: Rectangle{
            color: "#612f8f"
            }

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTrId("resetInputs")
                width: parent.width
                UserDataProvider{id:dataProvider}
                onClicked: {
                    stackView.push("ClearData.qml")
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTrId("contactUs")
                width: parent.width
                onClicked: {
                    stackView.push("ContactUs.qml")
                    drawer.close()
                }
            }

            ItemDelegate {
                text: qsTrId("rate")
                width: parent.width
                onClicked: {
                    drawer.close()
                    if (Qt.platform.os == "ios")
                        Qt.openUrlExternally("itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1459513911&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software")
                    else
                        Qt.openUrlExternally("https://play.google.com/store/apps/details?id=org.dontpanic")
                }
            }

            ItemDelegate {
                text: qsTrId("support")
                width: parent.width
                onClicked: {
                    stackView.push("Support.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "Home.qml"
        anchors.fill: parent
    }
}
