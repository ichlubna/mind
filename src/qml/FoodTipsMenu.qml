import QtQuick 2.4

FoodTipsMenuForm {
    figureButton.onClicked: stackView.push("FoodFigure.qml")
    remorseButton.onClicked: stackView.push("FoodTips.qml")
    overeatButton.onClicked: stackView.push("FoodOvereat.qml")
    vomitButton.onClicked: stackView.push("FoodVomit.qml")
    failButton.onClicked: stackView.push("FoodFail.qml")
    miscButton.onClicked: stackView.push("FoodMisc.qml")
}
