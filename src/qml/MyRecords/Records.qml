import QtQuick
import io.qt.UserDataProvider

RecordsForm {
    property int count: 0
    property bool dateOnly : false
    property bool sendingEnabled : false
    property string afterDateFile : "Record.qml"
    property string titleText : ""
    property var arrayNames : []
    property var questionTexts: []

    UserDataProvider {
        id: dataProvider
    }
    function fill() {
        var values = dataProvider.loadArrayInput(arrayNames[0]);
        var count = values.length;
        records.model = count;
        for (var i = 0; i < count; i++) {
            var listIndex = (count-1)-i;
            records.itemAt(listIndex).position = i;
            var recordValues = values[i].slice(0,25).split("|");
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
