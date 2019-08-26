import QtQuick 2.4

PanicForm {
    breath1Button.onClicked: stackView.push("../Games/Breath1.qml")
    breath2Button.onClicked: stackView.push("../Games/Breath2.qml")
    mathButton.onClicked: stackView.push("../Games/MathGame.qml")
    gameButton.onClicked: stackView.push("../Games/Balls.qml")
    panicTipsButton.onClicked: stackView.push("Tips.qml")

}
