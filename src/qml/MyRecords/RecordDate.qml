import QtQuick

RecordDateForm {
    property string afterDateFile : "Record.qml"
    property var arrayNames : []
    property var questionTexts: []
    property string titleText: ""

    okButton.onClicked: {
        var date = recordDate.getDate();
        stackView.replace(afterDateFile, {"date": date, "arrayNames" : arrayNames, "questionTexts" : questionTexts, "titleText" : titleText});
    }
}
