import QtQuick 2.4

FoodTasksMenuForm {
    creativeButton.onClicked: stackView.push(".qml")
    motivationButton.onClicked: stackView.push(".qml")
    challengeButton.onClicked: stackView.push(".qml")
    likeButton.onClicked: stackView.push(".qml")
    foodLikeButton.onClicked: stackView.push(".qml")
    afraidButton.onClicked: stackView.push(".qml")
}
