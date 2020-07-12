import QtQuick 2.4
import ".."

Menu{
    property alias choiceMenu: choiceMenu
    id: choiceMenu
    title: qsTrId("food-choice")
    items: [{text: qsTrId("food-breakfast"), file: "MyRecords/Record.qml", pushProperties: {"date" : date, "arrayIndex" : 1, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-am-snack"), file: "MyRecords/Record.qml", pushProperties: {"date" : date, "arrayIndex" : 2, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-lunch"), file:  "MyRecords/Record.qml", pushProperties: {"date" : date, "arrayIndex" : 3, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-pm-snack"), file:  "MyRecords/Record.qml", pushProperties: {"date" : date, "arrayIndex" : 4, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-dinner"), file:  "MyRecords/Record.qml", pushProperties: {"date" : date, "arrayIndex" : 5, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}},
            {text: qsTrId("food-second-dinner"), file:  "MyRecords/Record.qml", pushProperties: {"date" : date, "arrayIndex" : 6, "dateRecord" : dateRecord, "arrayNames" : arrayNames, "questionTexts" : questionTexts}}
            ]
}
