import QtQuick 2.4

DishesForm {
    breakfastButton.onClicked: stackView.push("Breakfast.qml")
    amSnackButton.onClicked: stackView.push("AmSnack.qml")
    lunchButton.onClicked: stackView.push("Lunch.qml")
    pmSnackButton.onClicked: stackView.push("PmSnack.qml")
    dinnerButton.onClicked: stackView.push("Dinner.qml")
}
