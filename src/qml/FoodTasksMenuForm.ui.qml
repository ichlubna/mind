import QtQuick 2.4

MenuPage {
    id: foodTasksPage
    property alias creativeButton: creativeButton
    property alias motivationButton: motivationButton
    property alias challengeButton: challengeButton
    property alias likeButton: likeButton
    property alias foodLikeButton: foodLikeButton
    property alias afraidButton: afraidButton
    title: qsTrId("food-tasks")

   MenuColumn{
       MenuButton {
           id: creativeButton
           text: qsTrId("food-tasks-creative")
       }
       MenuButton {
           id: motivationButton
           text: qsTrId("food-tasks-motivation")
       }
        MenuButton {
            id: challengeButton
            text: qsTrId("food-tasks-challenge")
        }

        MenuButton {
            id: likeButton
            text: qsTrId("food-tasks-like")
        }

        MenuButton {
            id: foodLikeButton
            text: qsTrId("food-tasks-food-like")
        }

        MenuButton {
            id: afraidButton
            text: qsTrId("food-tasks-afraid")
        }
    }
}
