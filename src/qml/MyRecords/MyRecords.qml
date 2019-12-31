import QtQuick 2.4

MyRecordsForm {
    moodButton.onClicked: stackView.push("Mood.qml")
    diaryButton.onClicked: stackView.push("Diary.qml")
}
