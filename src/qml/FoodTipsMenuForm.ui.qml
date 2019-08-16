import QtQuick 2.4

MenuPage {
    property alias figureButton: figureButton
    property alias remorseButton: remorseButton
    property alias overeatButton: overeatButton
    property alias vomitButton: vomitButton
    property alias failButton: failButton
    property alias miscButton: miscButton

    title: qsTrId("food")

   MenuColumn{
       MenuButton {
           id: figureButton
           text: qsTrId("food-figure")
       }
       MenuButton {
           id: remorseButton
           text: qsTrId("food-remorse")
       }
       MenuButton {
           id: overeatButton
           text: qsTrId("food-overeat")
       }
        MenuButton {
            id: vomitButton
            text: qsTrId("food-vomit")
        }

        MenuButton {
            id: failButton
            text: qsTrId("food-fail")
        }

        MenuButton {
            id: miscButton
            text: qsTrId("food-misc")
        }
    }
}
