import QtQuick 2.4

SupportForm {
    dusiLink.onClicked: Qt.openUrlExternally(qsTrId("dusi-link"))
    mlceniLink.onClicked: Qt.openUrlExternally(qsTrId("mlceni-link"))
    anabellLink.onClicked: Qt.openUrlExternally(qsTrId("anabell-link"))
    angelinyLink.onClicked: Qt.openUrlExternally(qsTrId("angeliny-link"))
}
