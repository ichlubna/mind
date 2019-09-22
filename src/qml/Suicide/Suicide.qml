import QtQuick 2.4

SuicideForm {
    breath1Button.onClicked: stackView.push("../Games/Breath1.qml")
    breath2Button.onClicked: stackView.push("../Games/Breath2.qml")
    breath3Button.onClicked: stackView.push("../Games/Breath3.qml")
    reasonsButton.onClicked: stackView.push("Reasons.qml")
    planButton.onClicked: stackView.push("Plan.qml")
}
