import QtQuick 2.4
import QtQuick.Controls 2.5
import ".."

MenuPage {
    id: planPage
    property alias customWrite: customWrite
    property alias customWriteBody: customWriteBody
    property alias customDo: customDo
    property alias customGo: customGo
    property alias customPpl: customPpl
    title: qsTrId("plan")

    ScrollView {
        anchors.fill: parent
        clip: true
    Column{
        anchors.fill: parent
        spacing: 10
        property int rowNum: 9

        DescriptionLabel{
            text: qsTrId("feeling-bad-write")
            width: parent.width
            height: parent.height/rowNum
        }
        MenuTextArea
        {
            id: customWrite
            width: parent.width
            height: parent.height/rowNum
        }
        DescriptionLabel{
            text: qsTrId("feeling-bad-write-body")
            width: parent.width
            height: parent.height/rowNum
        }
        MenuTextArea
        {
            id: customWriteBody
            width: parent.width
            height: parent.height/rowNum
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }
        DescriptionLabel{
            text: qsTrId("feeling-bad-do")
            width: parent.width
            height: parent.height/rowNum
        }
        MenuTextArea{
            id: customDo
            width: parent.width
            height: parent.height/rowNum
        }
        DescriptionLabel{
            text: qsTrId("feeling-bad-go")
            width: parent.width
            height: parent.height/rowNum
        }
        MenuTextArea{
            id: customGo
            width: parent.width
            height: parent.height/rowNum
        }
        DescriptionLabel{
            text: qsTrId("people-to-write")
            width: parent.width
            height: parent.height/rowNum
        }
        MenuTextArea{
            id: customPpl
            width: parent.width
            height: parent.height/rowNum
        }
    }}
}



