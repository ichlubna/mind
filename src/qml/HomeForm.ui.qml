import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12

MenuPage {
    id: homePage
    property alias contactButton: contactButton
    property alias depressionButton: depressionButton
    property alias panicButton: panicButton
    property alias selfHarmButton: selfHarmButton
    property alias suicideButton: suicideButton
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
            id: depressionButton
            text: qsTrId("depression")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            id: panicButton
            text: qsTrId("anxiety-panic")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            id: selfHarmButton
            text: qsTrId("self-harm")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width / 2
            id: suicideButton
            text: qsTrId("suicidal-thoughts")
        }

        MenuButton {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width
            id: contactButton
            text: qsTrId("help-contacts")
            Layout.columnSpan: 2
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/

