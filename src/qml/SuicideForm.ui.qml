import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

MenuPage {
    id: panicPage
    title: qsTrId("suicidal-thoughts")

   MenuColumn{
        MenuButton {
           id: planButton
           text: qsTrId("plan")
        }
        Connections {
           target: planButton
           onClicked: stackView.push("Plan.qml")
        }

        MenuButton {
            id: breath1Button
            text: qsTrId("breath1")
        }
        Connections {
            target: breath1Button
            onClicked: stackView.push("Breath1.qml")
        }

        MenuButton {
            id: breath2Button
            text: qsTrId("breath2")
        }
        Connections {
            target: breath2Button
            onClicked: stackView.push("Breath2.qml")
        }

        MenuButton {
            id: reasonsButton
            text: qsTrId("reasons")
        }
        Connections {
            target: reasonsButton
            onClicked: stackView.push("Reasons.qml")
        }
    }
}
