import QtQuick 2.4

MenuPage {
    id: depressionPage
    property alias helpButton: helpButton
    property alias planButton: planButton
    property alias niceButton: niceButton
    property alias moodButton: moodButton
    title: qsTrId("depression")

   MenuColumn{
        MenuButton {
            id: helpButton
            text: qsTrId("depression-help")
        }

        MenuButton {
            id: planButton
            text: qsTrId("depression-plan")
        }

        MenuButton {
            id: niceButton
            text: qsTrId("depression-nice")
        }

        MenuButton {
            id: moodButton
            text: qsTrId("depression-mood")
        }
    }
}
