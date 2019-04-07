import QtQuick 2.4

MenuPage {
    id: breath2Page
    property alias one: one
    property alias two: two
    property alias three: three
    property alias four: four
    property alias bar: bar
    property alias sprite: sprite
    property alias breathIn: breathIn
    property alias breathOut: breathOut
    property alias breathHold: breathHold
    title: qsTrId("breath2")

    property int numberSize: 150

    Description {
        text: qsTrId("breathe-info")
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
    }

    Description {
        id: one
        text: "1"
        font.pointSize: numberSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
    Description {
        id: two
        text: "2"
        font.pointSize: numberSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        opacity: 0.0
    }
    Description {
        id: three
        text: "3"
        font.pointSize: numberSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        opacity: 0.0
    }
    Description {
        id: four
        text: "4"
        font.pointSize: numberSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        opacity: 0.0
    }
    Description {
        id: breathIn
        text: qsTrId("breathe-in")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 1.0
    }
    Description {
        id: breathOut
        text: qsTrId("breathe-out")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 0.0
    }
    Description {
        id: breathHold
        text: qsTrId("breathe-hold")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 0.0
    }

    Rectangle {
        id: bar
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width

        height: parent.height * 0.05
        color: "White"
        opacity: 0.15
    }

    Image {
        id: sprite
        opacity: 0.1
        source: "qrc:/images/circle.svg"
        fillMode: Image.PreserveAspectFit
        width: (parent.width < parent.height) ? parent.width - 100 : parent.height - 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
