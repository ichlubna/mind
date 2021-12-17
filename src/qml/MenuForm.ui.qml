import QtQuick

MenuPage {
    property alias itemsList: itemsList
    //item: {button text, qml file, [excluded languages], [push properties]}
    property var items: [{}]
MenuColumn {
    Repeater{
        id: itemsList
        model: 0
    MenuButton {}
    }
}}
