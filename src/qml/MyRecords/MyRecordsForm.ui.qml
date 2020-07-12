import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("my-records")
    items: [{text: qsTrId("depression-mood"), file: "MyRecords/Mood.qml"},
            {text: qsTrId("diary"), file: "MyRecords/Records.qml", pushProperties: {"arrayNames" : ["diaryRecords"],  "questionTexts" : [{type: "text", question : ""}]}},
            {text: qsTrId("journal"), file: "MyRecords/Records.qml", pushProperties: {"arrayNames" : ["journalRecords"], "dateOnly" : true,
                "questionTexts" : [
                    {type: "text", question : qsTrId("journal-grateful")},
                    {type: "text", question : qsTrId("journal-great")},
                    {type: "text", question : qsTrId("journal-feel")},
                    {type: "text", question : qsTrId("journal-three")},
                    {type: "text", question : qsTrId("journal-improve")}
                    ],
            }},
            {text: qsTrId("food-records"), file: "MyRecords/Records.qml", pushProperties: {"dateOnly" : true, "sendingEnabled" : true, "afterDateFile" : "FoodChoice.qml",
                "questionTexts" : [
                    {type: "text", question : qsTrId("food-record-when")},
                    {type: "text", question : qsTrId("food-record-where")},
                    {type: "text", question : qsTrId("food-record-with")},
                    {type: "text", question : qsTrId("food-record-what")},
                    {type: "ticks", question : qsTrId("food-record-feel"), ticks : [qsTrId("food-problems-happy"), qsTrId("food-problems-satisfied"), qsTrId("food-problems-proud"), qsTrId("food-problems-fear"), qsTrId("food-problems-anger"), qsTrId("food-problems-anxiety"), qsTrId("food-problems-unsatisfied"), qsTrId("food-problems-disgusted"), qsTrId("food-problems-sad"), qsTrId("food-problems-stress")]},
                    {type: "ticks", question : qsTrId("food-record-problems"), ticks : [qsTrId("food-problems-vomit"), qsTrId("food-problems-exercise"), qsTrId("food-problems-self-harm"), qsTrId("food-problems-laxative"), qsTrId("food-problems-anxiety-attack")]}
                    ],
                "arrayNames" : ["foodRecordDates", "foodRecordBreakfast", "foodRecordAmSnack", "foodRecordLunch", "foodRecordPmSnack", "foodRecordDinner", "foodRecordSecondDinner"]
            }}
            ]
}
