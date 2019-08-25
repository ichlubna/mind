import QtQuick 2.4

DepressionForm {
    helpButton.onClicked: stackView.push("Help.qml")
    planButton.onClicked: stackView.push("Plan.qml")
    niceButton.onClicked: stackView.push("Nice.qml")
}
