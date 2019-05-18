import QtQuick 2.4

MenuPage {
    id: contactUsPage
    property alias fbLink: fbLink

    Description {
        id: contactUsText
        text: qsTrId("contact-us-text")
    }

    Image {
        height: parent.height * 0.4
        source: "qrc:/images/fb.svg"
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 10
        MouseArea {
            id: fbLink
            anchors.fill: parent
        }
    }
}

