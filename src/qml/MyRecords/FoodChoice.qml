import QtQuick

FoodChoiceForm {
    property var date: "";
    property var dataRecordIndex: -1;
    property var dateRecord: [date, "-1", "-1", "-1", "-1", "-1", "-1"];
    property var arrayNames : []
    property var questionTexts: []

    Connections{
        target: choiceMenu
        Component.onCompleted:  {
            if(date != "")
                dataRecordIndex = dataProvider.getIndexByDate(arrayNames[0], date);
            if(dataRecordIndex > -1)
                dateRecord = dataProvider.getFromArray(arrayNames[0], dataRecordIndex).split("|");
            }
        }
}
