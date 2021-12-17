import QtQuick
import QtQuick.Layouts 1.12
import ".."

SwipePage{
    property alias address: address
    property alias message: message
    property alias send: send
    title: qsTrId("contacts-message")

    InputScrollView{
        ColumnLayout {
            id: wrapper
            anchors.fill: parent
            spacing: 10
            anchors.margins: 15

            DescriptionLabel{
                text: qsTrId("myContactsNumbers-example")
            }

            MenuTextArea{
                id: address
                Layout.fillWidth: true
            }

            DescriptionLabel{
                text: qsTrId("message-text")
            }

            MenuTextArea{
                id: message
                Layout.fillWidth: true
            }

            MenuButton{
                id: send
                Layout.preferredWidth: parent.width*0.8
                Layout.alignment: Qt.AlignHCenter
                text: qsTrId("send")
            }
        }
    }

}
