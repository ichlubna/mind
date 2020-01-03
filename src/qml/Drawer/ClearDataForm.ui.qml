import QtQuick 2.4
import QtQuick.Controls 2.12
import ".."

MenuPage {
    id: clearDataPage
    property alias clearButton: clearButton
    property alias allButton: allButton
    property alias clearList: clearList
    property alias reasonsClear: reasonsClear
    property alias niceClear: niceClear
    property alias planClear: planClear
    property alias depresionPlanClear: depressionPlanClear
    property alias themeClear: themeClear
    property alias moodsClear: moodsClear
    property alias languageClear: languageClear
    property alias foodTasksClear: foodTasksClear
    property alias depressionPraiseClear: depressionPraiseClear
    property alias diaryClear: diaryClear
    property alias myContactsClear: myContactsClear
    title: qsTrId("clear-data")

    ScrollView {
        id: viewContainer
        anchors.fill: parent
        clip: true
        anchors.margins: 10
        contentWidth: -1
        contentHeight: clearList.height+allButton.height+50

    Grid {
        id: clearList
        width: parent.width
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

        DescriptionLabel {
            id: myContactsText
            text:  qsTrId("my-contacts")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: myContactsClear
                checked: false;
        }

        DescriptionLabel {
            id: diaryText
            text:  qsTrId("diary")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: diaryClear
                checked: false;
        }
    }
    MenuButton {
        id: clearButton
        text: qsTrId("clear-button")
        anchors.top: clearList.bottom
        anchors.margins: 10
        anchors.right: parent.horizontalCenter
        width: parent.width*0.4
    }

    MenuButton {
        id: allButton
        text: qsTrId("clear-all-button")
        anchors.top: clearList.bottom
        anchors.margins: 10
        anchors.left: parent.horizontalCenter
        width: parent.width*0.4
    }
}
}
