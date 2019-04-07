import QtQuick 2.9
import QtQuick.Controls 2.5

RoundButton {
    id: addButton
    width: 60
    height: 60
    background: Rectangle {
        id: bckg
        radius: parent.radius
        color: "#612f8f"
    }
    text: "+"
    onPressed: {
        bckg.color = "#7338aa"
    }
    onPressedChanged: {
        bckg.color = "#612f8f"
    }
}
