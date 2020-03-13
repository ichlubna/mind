import QtQuick 2.4
import QtQuick.Controls 2.5

DiaryRecordForm {
    property var recordIndex: -1
    property var arrayName: "diaryRecords"
    property var save: true
    property var date: ""
    StackView.onDeactivating:{if(save) dataProvider.addToSortedArray(arrayName, date+"|"+recordText.text, recordIndex);}

    Connections{
        target: view
        Component.onCompleted:  {
            if(date != "")
                recordIndex = dataProvider.getIndexByDate(arrayName, date);
            if(recordIndex > -1)
            {
                var record = dataProvider.getFromArray(arrayName, recordIndex).split("|");                
                recordText.text = record[1];
            }}
        }

    removeArea.onClicked:{
        popup.open();
       }

    popup.yes.onClicked:{
        dataProvider.removeFromArray(arrayName, recordIndex);
        save=false;
        stackView.pop();
    }

    popup.no.onClicked: popup.close()

    confirmArea.onClicked:{
        stackView.pop();}
}
