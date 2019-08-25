import QtQuick 2.4
import QtQuick.Layouts 1.12
import ".."

MenuPage {
    id: support
    title: qsTrId("support")
    property alias mlceniLink: mlceniLink
    property alias dusiLink: dusiLink
    property alias anabellLink: anabellLink


    GridLayout {
        anchors.fill: parent
        anchors.margins: 10
        columns: 2
        columnSpacing: parent.height * 0.1

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            source: "qrc:/images/dusi.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: dusiLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            source: "qrc:/images/mlceni.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: mlceniLink
                anchors.fill: parent
            }
        }

        Image {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width
            Layout.columnSpan: 2
            source: "qrc:/images/anabell/logo.svg"
            fillMode: Image.PreserveAspectFit
            MouseArea {
                id: anabellLink
                anchors.fill: parent
            }
        }

   }

   /* Column {
        anchors.topMargin: 10
        anchors.fill: parent
        transformOrigin: Item.Center
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: parent.height * 0.1

        Image {
            height: parent.height * 0.25
            source: "qrc:/images/dusi.svg"
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                id: dusiLink
                anchors.fill: parent
            }
        }

        Image {
            height: parent.height * 0.25
            source: "qrc:/images/mlceni.svg"
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                id: mlceniLink
                anchors.fill: parent
            }
        }

        Image {
            height: parent.height * 0.25
            source: "qrc:/images/anabell/logo.svg"
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                id: anabellLink
                anchors.fill: parent
            }
        }
    }*/
}
