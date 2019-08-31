import QtQuick 2.4

PanicForm {
    breath1Button.onClicked: stackView.push("../Games/Breath1.qml")
    breath2Button.onClicked: stackView.push("../Games/Breath2.qml")
    mathButton.onClicked: stackView.push("../Games/Math.qml")
    gameButton.onClicked: stackView.push("../Balls.qml")
    panicTipsButton.onClicked: stackView.push("Tips.qml")

}
