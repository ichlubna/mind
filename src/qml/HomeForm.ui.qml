import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12

MenuPage {
    id: homePage
    property var buttonHeight: 5
    property alias logo: logo
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
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Depression/Depression.qml"
            text: qsTrId("depression")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Panic/Panic.qml"
            text: qsTrId("anxiety-panic")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "SelfHarm/SelfHarm.qml"
            text: qsTrId("self-harm")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Suicide/Suicide.qml"
            text: qsTrId("suicidal-thoughts")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "Food/Food.qml"
            text: qsTrId("food")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            Layout.preferredHeight: parent.height / buttonHeight
            target: "MyRecords/MyRecords.qml"
            text: qsTrId("my-records")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width
            id: contactButton
            target: "Contacts/Contacts.qml"
            Layout.columnSpan: 2
            text: qsTrId("contacts")
        }
    }
}


