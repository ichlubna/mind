import QtQuick

Text {
    anchors.margins: 20
    anchors.fill: parent
    minimumPointSize: 10
    font.pointSize: 20
    fontSizeMode: Text.Fit
    color: "White"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    onLinkActivated: Qt.openUrlExternally(link)
    linkColor: "White"
}
