import QtQuick 2.4

MenuPage {
    id: support
    title: qsTrId("support")
    property alias mlceniLink: mlceniLink
    property alias dusiLink: dusiLink

    Column {
        anchors.topMargin: 10
        anchors.fill: parent
        transformOrigin: Item.Center
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: parent.height * 0.1

        Image {
            height: parent.height * 0.4
            source: "qrc:/images/dusi.svg"
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                id: dusiLink
                anchors.fill: parent
            }
        }

        Image {
            height: parent.height * 0.4
            source: "qrc:/images/mlceni.svg"
            fillMode: Image.PreserveAspectFit
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea {
                id: mlceniLink
                anchors.fill: parent
            }
        }
    }
}
