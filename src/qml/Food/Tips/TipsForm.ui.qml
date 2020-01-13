import QtQuick 2.4
import "../.."

Menu{
    title: qsTrId("food-tips")
    items: [{text: qsTrId("food-figure"), file: "Food/Tips/Figure.qml"},
            {text: qsTrId("food-remorse"), file: "Food/Tips/Advices.qml"},
            {text: qsTrId("food-overeat"), file: "Food/Tips/Overeat.qml"},
            {text: qsTrId("food-vomit"), file: "Food/Tips/Vomit.qml"},
            {text: qsTrId("food-fail"), file: "Food/Tips/Fail.qml"},
            {text: qsTrId("food-misc"), file: "Food/Tips/Misc.qml"},
            ]
}
