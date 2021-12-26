import QtQuick

Text {
    font.pointSize: 20
    fontSizeMode: Text.FixedSize
    color: "White"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    onLinkActivated: Qt.openUrlExternally(link)
    linkColor: "White"
}
