import QtQuick
import QtQuick.Controls
import ".."

MenuPage {
    id: clearDataPage
    property alias clearButton: clearButton
    property alias allButton: allButton
    property alias clearList: clearList
    title: qsTrId("clear-data")
    property var clearItems: [  qsTrId("reasons"),
                                qsTrId("depression-nice"),
                                qsTrId("plan"),
                                qsTrId("depression-plan"),
                                qsTrId("depression-praise"),
                                qsTrId("custom-theme"),
                                qsTrId("depression-mood"),
                                qsTrId("language"),
                                qsTrId("food"),
                                qsTrId("my-contacts"),
                                qsTrId("diary"),
                                qsTrId("food-records"),
                                qsTrId("self-harm-helped"),
                                qsTrId("self-harm")+" - "+qsTrId("plan"),
                                qsTrId("self-harm-timer"),
                                qsTrId("contacts-message"),
                                qsTrId("sleep-title")]
    ScrollView {
        id: viewContainer
        anchors.fill: parent
        clip: true
        contentWidth: -1
        contentHeight: clearListContainer.height+allButton.height+50
        anchors.leftMargin: 25
        anchors.rightMargin: 25

    Column {
        id: clearListContainer
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        Repeater{
            id: clearList
            model: clearItems
            Item{
                width: parent.width
                height: 50
                DescriptionLabel {
                    text: modelData
                    width: parent.width*0.75
                    anchors.left: parent.left
                }
                MenuCheckBox {
                    checked: false;
                    anchors.right: parent.right
                }
            }
        }
    }
    MenuButton {
        id: clearButton
        text: qsTrId("clear-button")
        anchors.top: clearListContainer.bottom
        anchors.margins: 10
        anchors.right: parent.horizontalCenter
        width: parent.width*0.4
    }

    MenuButton {
        id: allButton
        text: qsTrId("clear-all-button")
        anchors.top: clearListContainer.bottom
        anchors.margins: 10
        anchors.left: parent.horizontalCenter
        width: parent.width*0.4
    }
}
}
