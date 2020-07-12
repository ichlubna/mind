import QtQuick 2.4

RecordDateForm {
    property var afterDateFile : "Record.qml"
    property var arrayNames : []
    property var questionTexts: []

    okButton.onClicked: {
        var date = recordDate.getDate();
        stackView.replace(afterDateFile, {"date": date, "arrayNames" : arrayNames, "questionTexts" : questionTexts});
    }
}
