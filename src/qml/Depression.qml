import QtQuick 2.4

DepressionForm {
    helpButton.onClicked: stackView.push("DepressionHelp.qml")
    planButton.onClicked: stackView.push("DepressionPlan.qml")
    niceButton.onClicked: stackView.push("DepressionNice.qml")

}
