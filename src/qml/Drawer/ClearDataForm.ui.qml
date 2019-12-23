import QtQuick 2.4
import ".."

MenuPage {
    id: clearDataPage
    property alias clearButton: clearButton
    property alias reasonsClear: reasonsClear
    property alias niceClear: niceClear
    property alias planClear: planClear
    property alias depresionPlanClear: depressionPlanClear
    property alias themeClear: themeClear
    property alias moodsClear: moodsClear
    property alias languageClear: languageClear
    property alias foodTasksClear: foodTasksClear
    property alias depressionPraiseClear: depressionPraiseClear
    title: qsTrId("clear-data")

    Grid {
        id: clearList
        width: parent.width*0.9
        anchors.horizontalCenter: parent.horizontalCenter
        columns:2
        spacing: 20

        DescriptionLabel {
            id: reasonsClearText
            text: qsTrId("reasons")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: reasonsClear
                checked: false;
        }

        DescriptionLabel {
            id: niceClearText
            text: qsTrId("depression-nice")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: niceClear
                checked: false;
        }

        DescriptionLabel {
            id: planClearText
            text:  qsTrId("plan")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: planClear
                checked: false;
        }

        DescriptionLabel {
            id: depressionPlanClearText
            text:  qsTrId("depression-plan")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: depressionPlanClear
                checked: false;
        }

        DescriptionLabel {
            id: depressionPraiseClearText
            text:  qsTrId("depression-praise")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: depressionPraiseClear
                checked: false;
        }

        DescriptionLabel {
            id: themeClearText
            text:  qsTrId("custom-theme")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: themeClear
                checked: false;
        }

        DescriptionLabel {
            id: moodsClearText
            text:  qsTrId("depression-mood")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: moodsClear
                checked: false;
        }

        DescriptionLabel {
            id: languageClearText
            text:  qsTrId("language")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: languageClear
                checked: false;
        }

        DescriptionLabel {
            id: foodTasksText
            text:  qsTrId("food")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: foodTasksClear
                checked: false;
        }
    }
    MenuButton {
        id: clearButton
        text: qsTrId("clear-button")
        anchors.top: clearList.bottom
        anchors.margins: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width*0.8
    }
}
