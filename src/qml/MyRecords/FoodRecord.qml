import QtQuick 2.4
import QtQuick.Controls 2.5

FoodRecordForm {
    property var recordIndex: -1
    property var arrayNames : ["foodRecordDates", "foodRecordBreakfast", "foodRecordAmSnack", "foodRecordLunch", "foodRecordPmSnack", "foodRecordDinner", "foodRecordSecondDinner"]
    property var save: true
    property var date: ""
    property var index: 0
    property var dateRecord: []
    property var delimiter: "$_^#_$"

    StackView.onDeactivating:{
        if(save){
            var textAnswer = []
            var tickAnswer = []
            var clean = true;
            for(var i=0; i<questions.children.length; i++)
            {
                var item = questions.children[i];
                if(item.objectName === "input")
                {
                    textAnswer.push(item.text);
                    if(item.text !== "")
                        clean = false;
                }
                else if(item.objectName === "ticks")
                {
                    var ticks = "";
                    for(var j=0; j<item.children.length; j++)
                        if(item.children[j].objectName === "tick")
                        {
                            ticks += (item.children[j].checked) ? "1" : "0";
                            if(item.children[j].checked)
                                clean = false;
                        }
                    tickAnswer.push(ticks);
                }
            }
            var record = textAnswer.concat([delimiter]).concat(tickAnswer);
            if(!clean)
            {
                var position = dataProvider.addToSortedArray(arrayNames[index], record.join("|"), recordIndex);
                dateRecord[index] = position;
                var dateRecordIndex = dataProvider.getIndexByDate(arrayNames[0],dateRecord[0]);
                dataProvider.addToSortedArray(arrayNames[0], dateRecord.join("|"), dateRecordIndex);
            }
        }
    }

    Connections{
        target: view
        Component.onCompleted:  {
            recordIndex = parseInt(dateRecord[index]);
            if(recordIndex > -1)
            {
                var record = dataProvider.getFromArray(arrayNames[index], recordIndex).split("|");
                var tickIndex = record.indexOf(delimiter)+1;
                var textIndex = 0;

                for(var i=0; i<questions.children.length; i++)
                {
                    var item = questions.children[i];
                    if(item.objectName === "input")
                    {
                        item.text = record[textIndex];
                        textIndex++;
                    }
                    else if(item.objectName === "ticks")
                    {
                        var ticks = record[tickIndex].split("");
                        tickIndex++;
                        for(var j=0; j<item.children.length; j++)
                            if(item.children[j].objectName === "tick")
                            {
                                item.children[j].checked = (ticks[0] === "1");
                                ticks.shift();
                            }
                    }
                }
            }
        }
    }

    removeArea.onClicked:{
        popup.open();
       }

    function isEmpty(value){
        return parseInt(value) === -1;
    }

    popup.yes.onClicked:{
        dataProvider.removeFromArray(arrayNames[index], recordIndex);
        dateRecord[index] = "-1";
        var dateRecordIndex = dataProvider.getIndexByDate(arrayNames[0],dateRecord[0]);
        if(dateRecord.slice(1).every(isEmpty))
            dataProvider.removeFromArray(arrayNames[0], dateRecordIndex);
        else
            dataProvider.addToSortedArray(arrayNames[0], dateRecord.join("|"), dateRecordIndex);
        save=false;
        stackView.pop();
        stackView.pop();
    }

    popup.no.onClicked: popup.close()

    confirmArea.onClicked:{
        outFocuser.forceActiveFocus();
        stackView.pop();
        stackView.pop();}
}
