import QtQuick 2.4
import ".."

Menu{
    property alias choiceMenu: choiceMenu
    id: choiceMenu
    title: qsTrId("food-choice")
    items: [{text: qsTrId("food-breakfast"), file: "MyRecords/Record.qml", pushProperties: {"titleText" : qsTrId("food-breakfast"), "date" : date, "arrayIndex" : 1, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-am-snack"), file: "MyRecords/Record.qml", pushProperties: {"titleText" : qsTrId("food-am-snack"), "date" : date, "arrayIndex" : 2, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-lunch"), file:  "MyRecords/Record.qml", pushProperties: {"titleText" : qsTrId("food-lunch"),"date" : date, "arrayIndex" : 3, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-pm-snack"), file:  "MyRecords/Record.qml", pushProperties: {"titleText" : qsTrId("food-pm-snack"), "date" : date, "arrayIndex" : 4, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-dinner"), file:  "MyRecords/Record.qml", pushProperties: {"titleText" : qsTrId("food-dinner"), "date" : date, "arrayIndex" : 5, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-second-dinner"), file:  "MyRecords/Record.qml", pushProperties: {"titleText" : qsTrId("food-second-dinner"), "date" : date, "arrayIndex" : 6, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}}
            ]
}
