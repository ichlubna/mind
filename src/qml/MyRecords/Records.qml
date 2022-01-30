import QtQuick
import io.qt.UserDataProvider

RecordsForm {
    property int count: 0
    property bool dateOnly : false
    property bool sendingEnabled : false
    property string afterDateFile : "Record.qml"
    property string titleText : ""
    property int selectedYear : new Date().getFullYear()
    property int selectedMonth : new Date().getMonth()+1
    property var arrayNames : []
    property var questionTexts: []

    UserDataProvider {
        id: dataProvider
    }

    function shiftMonth(direction)
    {
        selectedMonth += direction;
        if(selectedMonth < 1)
        {
            selectedMonth = 12;
            selectedYear--;
        }
        else if(selectedMonth > 12)
        {
            selectedMonth = 1;
            selectedYear++;
        }
        fill();
    }

    rightButton.onClicked: shiftMonth(1)
    leftButton.onClicked: shiftMonth(-1)

    function fillModel(modelEntries)
    {
        var count = modelEntries.length;
        records.model = count;
        for (var i = 0; i < count; i++) {
            var listIndex = (count-1)-i;
            var recordValues = modelEntries[i].slice(0,25).split("|");
            records.itemAt(listIndex).date = recordValues[0];
            if(dateOnly)
            {
                for(var j = 1; j < recordValues.length; j++)
                    records.itemAt(listIndex).children[1].children[recordValues.length-j-1].ok = (recordValues[j]!=="-1");
                records.itemAt(listIndex).children[0].text = recordValues[0];;
            }
            else
                records.itemAt(listIndex).children[0].text = (recordValues[0]+" - "+recordValues[1]+"...").replace(/(\r\n|\n|\r)/gm, " ");
        }
    }

    function fill() {
        dateText.text = selectedMonth + "/" + selectedYear;
        var modelEntries = dataProvider.loadArrayInputMonth(arrayNames[0], selectedMonth, selectedYear);
        fillModel(modelEntries);
    }

    Connections {
        target: records
        Component.onCompleted: {
                fill();
        }
        function onVisibleChanged() {
                fill();
        }}

    Connections {
        target: addButton
        function onClicked() {
            stackView.push("RecordDate.qml", {"afterDateFile" : afterDateFile, "arrayNames" : arrayNames, "questionTexts" : questionTexts, "titleText" : titleText})
            if (viewContainer.contentHeight > viewContainer.height)
                viewContainer.contentItem.contentY = viewContainer.contentHeight
                        - viewContainer.height
        }
    }

    Connections {
        target: sendArea
        function onClicked() {
           stackView.push("SendRecords.qml")
        }
    }
}
