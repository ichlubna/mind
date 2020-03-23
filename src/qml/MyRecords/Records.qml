import QtQuick 2.4
import io.qt.UserDataProvider 1.0

RecordsForm {
    property int count: 0
    property var arrayName : "diaryRecords"
    property var dateOnly : false
    property var afterDateFile : "DiaryRecord.qml"

    UserDataProvider {
        id: dataProvider
    }
    function fill() {
        var values = dataProvider.loadArrayInput(arrayName);
        var count = values.length;
        records.model = count;
        for (var i = 0; i < count; i++) {
            var listIndex = (count-1)-i;
            records.itemAt(i).position = i;
            var recordValues = values[i].split("|");
            if(dateOnly)
                records.itemAt(listIndex).children[0].text = recordValues[0];
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
            stackView.push("RecordDate.qml", {"afterDateFile" : afterDateFile})
            if (viewContainer.contentHeight > viewContainer.height)
                viewContainer.contentItem.contentY = viewContainer.contentHeight
                        - viewContainer.height
        }
    }
}
