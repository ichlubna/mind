import QtQuick
import io.qt.UserDataProvider 1.0

SendRecordsForm {
    UserDataProvider {
        id: dataProvider
    }

    property var arrayName : "foodRecordDates";
    property var records : dataProvider.loadArrayInput(arrayName);
    property var editedMsg : false
    property var first : [];
    property var second : [];
    property var delimiter : '|';
    property var questionTexts: [qsTrId("food-record-when"), qsTrId("food-record-where"), qsTrId("food-record-with"), qsTrId("food-record-what"), qsTrId("food-record-feel"), qsTrId("food-record-problems")]
    property var arrayNames : ["foodRecordBreakfast", "foodRecordAmSnack", "foodRecordLunch", "foodRecordPmSnack", "foodRecordDinner", "foodRecordSecondDinner"]
    property var foodNames : [qsTrId("food-breakfast"), qsTrId("food-am-snack"), qsTrId("food-lunch"), qsTrId("food-pm-snack"), qsTrId("food-dinner"), qsTrId("food-second-dinner")]
    property var problemItems: [qsTrId("food-problems-vomit"), qsTrId("food-problems-exercise"), qsTrId("food-problems-self-harm"), qsTrId("food-problems-laxative"), qsTrId("food-problems-anxiety-attack")]
    property var feelItems: [qsTrId("food-problems-happy"), qsTrId("food-problems-satisfied"), qsTrId("food-problems-proud"), qsTrId("food-problems-fear"), qsTrId("food-problems-anger"), qsTrId("food-problems-anxiety"), qsTrId("food-problems-unsatisfied"), qsTrId("food-problems-disgusted"), qsTrId("food-problems-sad"), qsTrId("food-problems-stress")]

    function update(){
        first = records[slider.first.value].split(delimiter);
        second = records[slider.second.value].split(delimiter);
        rangeText.text = first[0] + " - " + second[0];
    }

    Connections{
        target: slider
        Component.onCompleted: {
            if(records.length === 0)
            {
                slider.visible = false;
                sendButton.visible = false;
                return;
            }
            slider.to = records.length-1;
            slider.second.value = slider.to;
            update();
        }
    }

    function ticksToAnswers(tickString, answers)
    {
        var result = "";
        for(var i=0; i<tickString.length; i++)
            result += (tickString[i] === "1") ? answers[i] + "<br>" : "";
        return result;
    }
    message.onTextChanged: editedMsg=true;
    choice.onCurrentValueChanged: {if(choice.count-1 != choice.currentIndex) email.text=choice.currentText; else email.text="";}
    slider.first.onMoved: update()
    slider.second.onMoved: update()
    sendButton.onClicked: {
        var body = (editedMsg) ? message.text+"<br><br>" : "";
        for(var i=slider.first.value; i<=slider.second.value; i++)
        {
            var record = records[i].split(delimiter);
            body += record[0] + "<br><br>";
            record.shift();
            for(var k=0; k<record.length; k++)
            {
                if(parseInt(record[k])===-1)
                    continue;
                body += foodNames[k]+"<br>";
                var content = dataProvider.getFromArray(arrayNames[k], parseInt(record[k])).split(delimiter);
                for(var j=0; j<questionTexts.length; j++)
                {
                    if(content[j] !== '')
                        body += questionTexts[j] + "<br>" + content[j] + "<br>";
                    if(j === 4)
                    {
                        var tickList = ticksToAnswers(content[content.length-2], feelItems);
                        if(content[j] === "" && tickList !== "")
                            body += questionTexts[j] + "<br>";
                        body += tickList;
                    }
                    else if(j === 5)
                    {
                        var tickList2 = ticksToAnswers(content[content.length-1], problemItems)
                        if(content[j] === "" && tickList2 !== "")
                            body += questionTexts[j] + "<br>";
                        body += tickList2;
                    }
                }

                body += "<br>";
            }
            body += "<br>";
        }
        Qt.openUrlExternally("mailto:"+email.text+"?subject="+qsTrId("food-records")+"&body="+body);
     }

    Connections{
        target: choice
        Component.onCompleted: {
            if ((dataProvider.loadLanguage() !== "CS") && (dataProvider.loadLanguage() !== "SK"))
            {
                    email.visible = true;
                    email.text = "email@email.com"
                    choice.visible = false;
            }
        }
    }

}
