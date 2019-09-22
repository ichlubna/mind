import QtQuick 2.4
import ".."

MenuPage {
    id: distractionPage
    property alias mathButton: mathButton
    property alias gameButton: gameButton
    property alias breath1Button: breath1Button
    property alias breath2Button: breath2Button
    property alias breath3Button: breath3Button
    title: qsTrId("distraction")

   MenuColumn{
        MenuButton {
            id: mathButton
            text: qsTrId("math")
        }

        MenuButton {
            id: gameButton
            text: qsTrId("game")
        }

        MenuButton {
            id: breath1Button
            text: qsTrId("breath1")
        }

        MenuButton {
            id: breath2Button
            text: qsTrId("breath2")
        }

        MenuButton {
            id: breath3Button
            text: qsTrId("breath3")
        }

    }
}
