import QtQuick 2.4
import io.qt.UserDataProvider 1.0

DiaryForm {
    property int count: 0
    property var arrayName: "diaryRecords"

    UserDataProvider {
        id: dataProvider
    }
    function fill() {
        var values = dataProvider.loadArrayInput(arrayName);
        var count = values.length;
        records.model = count;
        for (var i = 0; i < count; i++) {
            var recordValues = values[i].split("|");
            records.itemAt(i).children[0].text = recordValues[0]+" - "+recordValues[1].trim().slice(0,13)+"...";
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
            stackView.push("DiaryDate.qml")
            if (viewContainer.contentHeight > viewContainer.height)
                viewContainer.contentItem.contentY = viewContainer.contentHeight
                        - viewContainer.height
        }
    }
}
