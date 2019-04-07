import QtQuick 2.4
import QtQuick.Controls.Styles 1.4

MenuPage {
    id: panicPage
    property alias breath1Button: breath1Button
    property alias breath2Button: breath2Button
    property alias mathButton: mathButton
    property alias panicTipsButton: panicTipsButton
    title: qsTrId("panic")

   MenuColumn{
        MenuButton {
            id: breath1Button
            text: qsTrId("breath1")
        }

        MenuButton {
            id: breath2Button
            text: qsTrId("breath2")
        }

        MenuButton {
            id: mathButton
            text: qsTrId("math")
        }

        MenuButton {
            id: panicTipsButton
            text: qsTrId("panicTips")
        }
    }
}
