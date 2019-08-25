import QtQuick 2.4

SelfHarmForm {
    breath1Button.onClicked: stackView.push("../Games/Breath1.qml")
    breath2Button.onClicked: stackView.push("../Games/Breath2.qml")
    tipsButton.onClicked: stackView.push("Tips.qml")
}
