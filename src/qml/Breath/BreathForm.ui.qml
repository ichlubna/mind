import QtQuick
import ".."

Menu{
    title: qsTrId("breath")
    items: [{text: qsTrId("breath-one") + " I", file: "Breath/Breath1.qml"},
            {text: qsTrId("breath-one") + " II", file: "Breath/Breath2.qml"},
            {text: qsTrId("breath-one") + " III", file: "Breath/Breath3.qml"},

            ]
}
