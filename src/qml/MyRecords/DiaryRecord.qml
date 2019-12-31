import QtQuick 2.4
import QtQuick.Controls 2.5

DiaryRecordForm {
    property var recordIndex: -1
    property var arrayName: "diaryRecords"
    property var save: true
    StackView.onDeactivating:{dataProvider.addToArray(arrayName, recordDate.getDate()+"|"+recordText.text, recordIndex);}


    Connections{
        target: view
        Component.onCompleted:  {
            if(recordIndex > -1)
            {
                var record = dataProvider.getFromArray(arrayName, recordIndex).split("|");
                recordDate.setDate(record[0]);
                recordText.text = record[1];
            }}
        }

    function remove()
    {
        if(recordIndex >-1)
        {
            var records = dataProvider.loadArrayInput(arrayName);
            records.splice(recordIndex, 1);
            dataProvider.saveArrayInput(arrayName, records);
        }
        save=false;
        stackView.pop();
    }
}
