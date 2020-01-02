import QtQuick 2.4

DiaryDateForm {
    property var arrayName: "diaryRecords"

    okButton.onClicked: {
        var date = recordDate.getDate();
        var index = dataProvider.getIndexByDate(arrayName, date);
        stackView.replace("DiaryRecord.qml", {"recordIndex": index, "date": date});
    }
}
