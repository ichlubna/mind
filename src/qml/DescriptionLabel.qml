import QtQuick 2.0

Text {
    minimumPointSize: 10
    font.pointSize: 20
    fontSizeMode: Text.Fit
    color: "White"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    onLinkActivated: Qt.openUrlExternally(link)
    linkColor: "White"
}
