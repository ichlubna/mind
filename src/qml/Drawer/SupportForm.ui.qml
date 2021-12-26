import QtQuick
import QtQuick.Layouts 
import QtQuick.Controls
import ".."

MenuPage {
    id: support
    title: qsTrId("support")
    property alias anabellLink: anabellLink
    property alias angelinyLink: angelinyLink
    property alias krejtaLink: krejtaLink
    property alias ppfLink: ppfLink
    property alias livechatooLink: livechatooLink
    property alias cezLink: cezLink
    property alias reenioLink: reenioLink
    property alias koresLink: koresLink
    property alias dollerLink: dollerLink
    property alias stabiloLink: stabiloLink
    property alias kofiLink: kofiLink

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true
        padding: 20

    ColumnLayout {
        anchors.fill: parent
        anchors.top: parent.top
        spacing: 20
        property int prefHeight: 200

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight*2
            source: "qrc:/images/ppf.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: ppfLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight*1.5
            source: "qrc:/images/livechatoo.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: livechatooLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight*1.5
            source: "qrc:/images/cez.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: cezLink
                anchors.fill: parent
            }
        }


        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/reenio.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: reenioLink
                anchors.fill: parent
            }
        }


        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/anabell/logo.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: anabellLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/angeliny.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: angelinyLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/krejta.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: krejtaLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/kores.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: koresLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/doller.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: dollerLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/stabilo.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: stabiloLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/kofi.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: kofiLink
                anchors.fill: parent
            }
        }

   }

}}


