import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12

MenuPage {
    id: homePage
    property var buttonHeight: 5
    property alias logo: logo
    property alias homePage: homePage
    property alias b1: b1
    property alias b2: b2
    property alias b3: b3
    property alias b4: b4
    property alias b5: b5
    property alias b6: b6
    property alias b7: b7
    title: qsTrId("home")

    GridLayout {
        anchors.margins: parent.width / 25
        anchors.fill: parent
        columns: 2
        columnSpacing: 25
        rowSpacing: 10

        Image {
            id: logo
            source: "qrc:/images/logo.svg"
            fillMode: Image.PreserveAspectFit

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height / 7
            Layout.columnSpan: 2
            opacity: 0.5
        }

        MenuButton {
            id: b1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Depression/Depression.qml"
            text: qsTrId("depression")
            scale: 0
        }

        MenuButton {
            id: b2
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Panic/Panic.qml"
            text: qsTrId("anxiety-panic")
            scale: 0
        }

        MenuButton {
            id: b3
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "SelfHarm/SelfHarm.qml"
            text: qsTrId("self-harm")
            scale: 0
        }

        MenuButton {
            id: b4
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Suicide/Suicide.qml"
            text: qsTrId("suicidal-thoughts")
            scale: 0
        }

        MenuButton {
            id: b5
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Food/Food.qml"
            text: qsTrId("food")
            scale: 0
        }

        MenuButton {
            id: b6
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "MyRecords/MyRecords.qml"
            text: qsTrId("my-records")
            scale: 0
        }

        MenuButton {
            id: b7
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width
            target: "Contacts/Contacts.qml"
            Layout.columnSpan: 2
            text: qsTrId("contacts")
            scale: 0
        }
    }
}


