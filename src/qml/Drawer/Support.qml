import QtQuick 2.4

SupportForm {
    dusiLink.onClicked: Qt.openUrlExternally("http://nevypustdusi.cz/")
    anabellLink.onClicked: Qt.openUrlExternally(qsTrId("http://www.anabell.cz"))
    angelinyLink.onClicked: Qt.openUrlExternally(qsTrId("https://www.angelini.cz/"))
    krejtaLink.onClicked: Qt.openUrlExternally(qsTrId("https://www.krejta.cz/"))
    ppfLink.onClicked: Qt.openUrlExternally(qsTrId("https://nadaceppf.cz/"))
}
