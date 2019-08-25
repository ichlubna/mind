import QtQuick 2.4

TipsForm {
    figureButton.onClicked: stackView.push("Figure.qml")
    advicesButton.onClicked: stackView.push("Advices.qml")
    overeatButton.onClicked: stackView.push("Overeat.qml")
    vomitButton.onClicked: stackView.push("Vomit.qml")
    failButton.onClicked: stackView.push("Fail.qml")
    miscButton.onClicked: stackView.push("Misc.qml")
}
