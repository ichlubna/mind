import QtQuick 2.4

FoodChoiceForm {
    property var date: "";
    property var recordIndex: -1;
    property var arrayName: "foodRecordDates"
    property var dateRecord: [date, "-1", "-1", "-1", "-1", "-1", "-1"];

    Connections{
        target: choiceMenu
        Component.onCompleted:  {
            if(date != "")
                recordIndex = dataProvider.getIndexByDate(arrayName, date);
            if(recordIndex > -1)
                dateRecord = dataProvider.getFromArray(arrayName, recordIndex).split("|");
            }
        }
}
