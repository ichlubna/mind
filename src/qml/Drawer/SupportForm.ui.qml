import QtQuick 2.4
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import ".."

MenuPage {
    id: support
    title: qsTrId("support")
    property alias dusiLink: dusiLink
    property alias anabellLink: anabellLink
    property alias angelinyLink: angelinyLink
    property alias krejtaLink: krejtaLink
    property alias ppfLink: ppfLink

    ScrollView {
        anchors.fill: parent
        contentWidth: -1
        clip: true

    ColumnLayout {
        anchors.fill: parent
        anchors.top: parent.top
        spacing: 20
        property var prefHeight: 200

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight*1.5
            source: "qrc:/images/ppf.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: ppfLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.prefHeight
            source: "qrc:/images/dusi.png"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: dusiLink
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

   }

}}


