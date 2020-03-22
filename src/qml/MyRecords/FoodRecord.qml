import QtQuick 2.4
import QtQuick.Controls 2.5

FoodRecordForm {
    property var recordIndex: -1
    property var arrayNames : ["foodRecordDates", "foodRecordBreakfast", "foodRecordAmSnack", "foodRecordLunch", "foodRecordPmSnack", "foodRecordDinner", "foodRecordSecondDinner"]
    property var save: true
    property var date: ""
    property var index: 0
    property var dateRecord: []
    property var dateRecordIndex: -1

    StackView.onDeactivating:{
        if(save){
            var record = []
            for(var i=0; i<6; i++)
            {
                record.push(questions.children[i*2+2].text);
            }
            var position = dataProvider.addToSortedArray(arrayNames[index], record.join("|"), recordIndex);
            dateRecord[index] = position;
            dateRecordIndex = dataProvider.getIndexByDate(arrayNames[0],dateRecord[0]);
            dataProvider.addToSortedArray(arrayNames[0], dateRecord.join("|"), dateRecordIndex);
        }
    }

    Connections{
        target: view
        Component.onCompleted:  {
            recordIndex = dateRecord[index];
            if(recordIndex > -1)
            {
                var record = dataProvider.getFromArray(arrayNames[index], recordIndex).split("|");
                for(var i=0; i<6; i++)
                {
                    questions.children[i*2+2].text = record[i];
                }
            }
        }
    }

    removeArea.onClicked:{
        popup.open();
       }

    function isEmpty(value){
        return value === -1;
    }

    popup.yes.onClicked:{
        dataProvider.removeFromArray(arrayNames[index], recordIndex);
        dateRecord[index] = -1;
        if(dateRecord.slice(1).every(isEmpty))
            dataProvider.removeFromArray(arrayNames[0], dateRecordIndex);
        save=false;
        stackView.pop();
    }

    popup.no.onClicked: popup.close()

    confirmArea.onClicked:{
        stackView.pop();}
}
