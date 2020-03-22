import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("my-records")
    items: [{text: qsTrId("depression-mood"), file: "MyRecords/Mood.qml"},
            {text: qsTrId("diary"), file: "MyRecords/Records.qml", pushProperties: {"arrayName" : "diaryRecords", "dateOnly" : false, "afterDateFile" : "DiaryRecord.qml"}},
            {text: qsTrId("food-records"), file: "MyRecords/Records.qml", pushProperties: {"arrayName" : "foodRecordDates", "dateOnly" : true, "afterDateFile" : "FoodChoice.qml"}}
            ]
}
