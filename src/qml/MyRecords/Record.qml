import QtQuick
import QtQuick.Controls

RecordForm {
    property int dataRecordIndex: -1
    property bool save: true
    property string date: ""
    property int arrayIndex: 0
    //if only one name is provided then all data are stored in this array along with date, otherwise first one is data array and rest for data
    property var arrayNames : []
    property var questionTexts: []
    property var dateRecord: []
    property string delimiter: "$_^#_$"
    property string titleText: ""

    StackView.onDeactivating:{
        if(save){
            var textAnswer = []
            var tickAnswer = []
            var clean = true;
            for(var i=0; i<questionTexts.length; i++)
            {
                var item = questions.children[i];
                if(questionTexts[i].type === "text")
                {
                    textAnswer.push(item.children[1].text);
                    if(item.text !== "")
                        clean = false;
                }
                else if(questionTexts[i].type === "ticks")
                {
                    var ticks = "";
                    var ticksElements = item.children[2].children
                    for(var j=0; j<ticksElements.length; j++)
                        if(ticksElements[j].objectName === "tick")
                        {
                            ticks += (ticksElements[j].checked) ? "1" : "0";
                            if(ticksElements[j].checked)
                                clean = false;
                        }
                    tickAnswer.push(ticks);
                }
            }
            var record = textAnswer.concat([delimiter]).concat(tickAnswer);
            if(!clean)
            {
                if(date != "")
                    dateRecord[0] = date
                if(arrayNames.length == 1)
                {
                    record.unshift(dateRecord[0]);
                    record[0] = dateRecord[0];
                }
                var position = dataProvider.addToSortedArray(arrayNames[arrayIndex], record.join("|"), dataRecordIndex);
                if(arrayNames.length > 1)
                {
                    dateRecord[arrayIndex] = position;
                    var dateRecordIndex = dataProvider.getIndexByDate(arrayNames[0],dateRecord[0]);
                    dataProvider.addToSortedArray(arrayNames[0], dateRecord.join("|"), dateRecordIndex);
                }
            }
        }
    }

    Connections{
        target: view
        Component.onCompleted:  {
            var textIndex = 1;
            if(arrayNames.length > 1)
            {
                textIndex = 0;
                dataRecordIndex = parseInt(dateRecord[arrayIndex]);
            }
            else if(date != "")
                dataRecordIndex = dataProvider.getIndexByDate(arrayNames[arrayIndex],date);
            if(dataRecordIndex > -1)
            {
                var record = dataProvider.getFromArray(arrayNames[arrayIndex], dataRecordIndex).split("|");
                var tickIndex = record.indexOf(delimiter)+1;

                if(arrayNames.length == 1)
                    dateRecord[0] = record[0];

                for(var i=0; i<questionTexts.length; i++)
                {
                    var item = questions.children[i];
                    if(questionTexts[i].type === "text")
                    {
                        item.children[1].text = record[textIndex];
                        textIndex++;
                    }
                    else if(questionTexts[i].type === "ticks")
                    {
                        var ticksElements = item.children[2].children
                        var ticks = record[tickIndex].split("");
                        tickIndex++;
                        for(var j=0; j<ticksElements.length; j++)
                            if(ticksElements[j].objectName === "tick")
                            {
                                ticksElements[j].checked = (ticks[0] === "1");
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
        popup.close();
        hideBlur();
        dataProvider.removeFromArray(arrayNames[arrayIndex], dataRecordIndex);
        if(arrayNames.length > 1)
        {
            dateRecord[arrayIndex] = "-1";
            var dateRecordIndex = dataProvider.getIndexByDate(arrayNames[0],dateRecord[0]);
            if(dateRecord.slice(1).every(isEmpty))
                dataProvider.removeFromArray(arrayNames[0], dateRecordIndex);
            else
                dataProvider.addToSortedArray(arrayNames[0], dateRecord.join("|"), dateRecordIndex);
        }
        save=false;
        stackView.pop();
    }

    popup.no.onClicked: popup.close()

    confirmArea.onClicked:{
        outFocuser.forceActiveFocus();
        stackView.pop();
    }
}
