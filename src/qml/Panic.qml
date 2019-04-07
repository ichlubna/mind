import QtQuick 2.4

PanicForm {
    breath1Button.onClicked: stackView.push("Breath1.qml")
    breath2Button.onClicked: stackView.push("Breath2.qml")
    mathButton.onClicked: stackView.push("Math.qml")
    panicTipsButton.onClicked: stackView.push("PanicTips.qml")

}
