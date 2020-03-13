import QtQuick 2.4

RecordDateForm {
    property var afterDateFile : "DiaryRecord.qml"

    okButton.onClicked: {
        var date = recordDate.getDate();
        stackView.replace(afterDateFile, {"date": date});
    }
}
