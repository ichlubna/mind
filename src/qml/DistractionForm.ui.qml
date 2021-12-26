import QtQuick
import ".."

Menu{
    title: qsTrId("distraction")
    items: [{text: qsTrId("math"), file: "Games/MathQuiz.qml"},
            {text: qsTrId("games"), file: "Games/Games.qml"},
            {text: qsTrId("numbers-exercise"), file: "Games/NumbersExercise.qml"},
            {text: qsTrId("relaxation"), file: "Player.qml", pushProperties: {"titleText" : qsTrId("relaxation"), "file" : "qrc:/audio/relaxCS.mp3"}, excluded: czSkOnly}
            ]
}
