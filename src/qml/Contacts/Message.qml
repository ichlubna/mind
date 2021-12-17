import QtQuick
import io.qt.UserDataProvider 1.0

MessageForm {
    UserDataProvider {
        id: dataProvider
    }
    property var addressName : "contactMessageAddress"
    property var messageName : "contactMessageBody"

    Connections {
        target: wrapper
        Component.onCompleted: {
            address.text = dataProvider.loadInput(addressName);
            message.text = dataProvider.loadInput(messageName);
        }
        onVisibleChanged: {
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
}
