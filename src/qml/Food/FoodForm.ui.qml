import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("food")
    items: [{text: qsTrId("food-tips"), file: "Food/Tips/Tips.qml"},
            {text: qsTrId("food-tasks"), file: "Food/Tasks/Tasks.qml"},
            {text: qsTrId("food-dishes"), file: "Food/Dishes/Dishes.qml"},
            {text: qsTrId("distraction"), file: "Food/Distraction.qml"},
            {text: qsTrId("food-contact"), file: "Food/Contact.qml", excluded: ["PL", "IT", "FR", "EN", "ES"]},
            ]
}
