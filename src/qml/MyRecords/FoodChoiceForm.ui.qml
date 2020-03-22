import QtQuick 2.4
import ".."

Menu{
    property alias choiceMenu: choiceMenu
    id: choiceMenu
    title: qsTrId("food-choice")
    items: [{text: qsTrId("food-breakfast"), file: "MyRecords/FoodRecord.qml", pushProperties: {"date" : date, "index" : 1, "dateRecord" : dateRecord}},
            {text: qsTrId("food-am-snack"), file: "MyRecords/FoodRecord.qml", pushProperties: {"date" : date, "index" : 2, "dateRecord" : dateRecord}},
            {text: qsTrId("food-lunch"), file:  "MyRecords/FoodRecord.qml", pushProperties: {"date" : date, "index" : 3, "dateRecord" : dateRecord}},
            {text: qsTrId("food-pm-snack"), file:  "MyRecords/FoodRecord.qml", pushProperties: {"date" : date, "index" : 4, "dateRecord" : dateRecord}},
            {text: qsTrId("food-dinner"), file:  "MyRecords/FoodRecord.qml", pushProperties: {"date" : date, "index" : 5, "dateRecord" : dateRecord}},
            {text: qsTrId("food-second-dinner"), file:  "MyRecords/FoodRecord.qml", pushProperties: {"date" : date, "index" : 6, "dateRecord" : dateRecord}}
            ]
}
