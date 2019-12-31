import QtQuick 2.4
import ".."

MenuPage {
    id: foodPage
    property alias moodButton: moodButton
    property alias diaryButton: diaryButton
    title: qsTrId("food")

    Description{
        id: comming
        text: "Comming soon. We are working on translations."
        visible: false
    }

   MenuColumn{
       id: menuCol
       MenuButton {
           id: moodButton
           text: qsTrId("depression-mood")
       }
       MenuButton {
           id: diaryButton
           text: qsTrId("diary")
       }
    }
}
