import QtQuick 2.4

MenuPage {
    property alias itemsList: itemsList
    //item: {button text, qml file, [excluded languages]}
    property var items: [{}]
MenuColumn {
    Repeater{
        id: itemsList
        model: 0
    MenuButton {}
    }
}}
