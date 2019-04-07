import QtQuick 2.4

MenuPage {
    id: clearDataPage
    property alias clearButton: clearButton
    property alias reasonsClear: reasonsClear
    property alias niceClear: niceClear
    property alias planClear: planClear
    property alias depresionPlanClear: depressionPlanClear
    title: qsTrId("clear-data")

    Grid {
        id: clearList
        width: parent.width
        anchors.margins: 20
        columns:2
        verticalItemAlignment: Grid.AlignVCenter
        horizontalItemAlignment: Grid.AlignHCenter


        DescriptionLabel {
            id: reasonsClearText
            text: qsTrId("reasons")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: reasonsClear
                checked: true;
        }

        DescriptionLabel {
            id: niceClearText
            text: qsTrId("depression-nice")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: niceClear
                checked: true;
        }

        DescriptionLabel {
            id: planClearText
            text:  qsTrId("plan")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: planClear
                checked: true;
        }

        DescriptionLabel {
            id: depressionPlanClearText
            text:  qsTrId("depression-plan")
            width: parent.width*0.75
        }
        MenuCheckBox {
                id: depressionPlanClear
                checked: true;
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
