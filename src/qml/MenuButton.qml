import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Button {
    property alias bckg:bckg
    width: parent.width
    background:  Rectangle {
        id: bckg
        color: "#612f8f"
        radius: 10
    }
    focusPolicy: Qt.StrongFocus
    padding: 20
    font.capitalization: Font.AllUppercase
    font.pointSize: 15
    onPressed: {bckg.color="#7338aa"}
    onPressedChanged:  {bckg.color="#612f8f"}

}
