import QtQuick 2.4
import ".."

Menu{
    title: qsTrId("depression")
    items: [{text: qsTrId("depression-help"), file: "Depression/Help.qml"},
            {text: qsTrId("depression-plan"), file: "Depression/Plan.qml"},
            {text: qsTrId("depression-nice"), file: "Depression/Nice.qml"},
            {text: qsTrId("depression-praise"), file: "Depression/Praise.qml"},
            ]
}
