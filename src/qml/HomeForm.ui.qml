import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12

MenuPage {
    id: homePage
    property var buttonHeight: 5
    property alias logo: logo
    property alias homePage: homePage
    property alias buttons: buttons
    title: qsTrId("home")
    property var sections: [
        {section: "Depression/Depression.qml", name: qsTrId("depression")},
        {section: "Panic/Panic.qml", name: qsTrId("anxiety-panic")},
        {section: "SelfHarm/SelfHarm.qml", name: qsTrId("self-harm")},
        {section: "Suicide/Suicide.qml", name: qsTrId("suicidal-thoughts")},
        {section: "Food/Food.qml", name: qsTrId("food")},
        {section: "MyRecords/MyRecords.qml", name: qsTrId("my-records")},
        {section: "Contacts/Contacts.qml", name: qsTrId("contacts")},
    ]

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

        Repeater{
            id: buttons
            model: sections
            MenuButton {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: (index < buttons.count-1) ? parent.width / 2 : parent.width
                Layout.columnSpan: (index < buttons.count-1) ? 1 : 2
                Layout.preferredHeight: parent.height / buttonHeight
                target: modelData.section
                text: modelData.name
                scale: 0
            }
        }
    }
}


