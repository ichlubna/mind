import QtQuick
import io.qt.UserDataProvider

MessageForm {
    UserDataProvider {
        id: dataProvider
    }
    property string addressName : "contactMessageAddress"
    property string messageName : "contactMessageBody"

    Connections {
        target: wrapper
        Component.onCompleted: {
            address.text = dataProvider.loadInput(addressName);
            message.text = dataProvider.loadInput(messageName);
        }
        function onVisibleChanged() {
            dataProvider.saveInput(addressName, address.text);
            dataProvider.saveInput(messageName, message.text);
        }
    }

    send.onClicked: {
     if(address.text.includes("@"))
        Qt.openUrlExternally("mailto:"+address.text+"?subject="+qsTrId("appName")+"&body="+message.text);
     else
        Qt.openUrlExternally("sms:"+address.text+"?&body="+message.text);
    }

    dontpanic.onClicked: {
        Qt.openUrlExternally("mailto:dobrovolnici@nepanikar.eu?subject="+qsTrId("appName")+"&body="+message.text);
    }
}
