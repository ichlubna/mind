import QtQuick 2.4

SupportForm {
    dusiLink.onClicked: Qt.openUrlExternally(qsTrId("dusi-link"))
    mlceniLink.onClicked: Qt.openUrlExternally(qsTrId("mlceni-link"))
}
