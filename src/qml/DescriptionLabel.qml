import QtQuick 2.0

Text {
    font.pointSize: 20
    fontSizeMode: Text.FixedSize
    color: "White"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    onLinkActivated: Qt.openUrlExternally(link)
    linkColor: "White"
}
