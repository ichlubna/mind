import QtQuick 2.4
import io.qt.UserDataProvider 1.0

RecordsForm {
    property int count: 0
    property var dateOnly : false
    property var sendingEnabled : false
    property var afterDateFile : "Record.qml"
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
            //the string could be trimmed here before split (speed) - TODO if needed
            var recordValues = values[i].split("|");
            if(dateOnly)
            {
                for(var j = 1; j < recordValues.length; j++)
                    records.itemAt(listIndex).children[1].children[recordValues.length-j-1].ok = (recordValues[j]!=="-1");
                records.itemAt(listIndex).children[0].text = recordValues[0];;
            }
            else
                records.itemAt(listIndex).children[0].text = recordValues[0]+" - "+recordValues[1].trim().slice(0,13)+"...";
        }
    }

    Connections {
        target: records
        Component.onCompleted: {
                fill();
        }
        onVisibleChanged: {
                fill();
        }}

    Connections {
        target: addButton
        onClicked: {
            stackView.push("RecordDate.qml", {"afterDateFile" : afterDateFile, "arrayNames" : arrayNames, "questionTexts" : questionTexts})
            if (viewContainer.contentHeight > viewContainer.height)
                viewContainer.contentItem.contentY = viewContainer.contentHeight
                        - viewContainer.height
        }
    }

    Connections {
        target: sendArea
        onClicked: {
           stackView.push("SendRecords.qml")
        }
    }
}
