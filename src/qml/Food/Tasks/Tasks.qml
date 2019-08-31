import QtQuick 2.4

TasksForm {
    creativeButton.onClicked: stackView.push("Creative.qml")
    motivationButton.onClicked: stackView.push("Motivation.qml")
    challengeButton.onClicked: stackView.push("Challenge.qml")
    likeButton.onClicked: stackView.push("Like.qml")
    foodLikeButton.onClicked: stackView.push("FoodLike.qml")
    afraidButton.onClicked: stackView.push("Afraid.qml")
}
