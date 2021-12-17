import QtQuick
import "../.."

Menu{
    title: qsTrId("food-tips")
    items: [{text: qsTrId("food-figure"), file: "SwipeItems.qml", pushProperties: {"withDescription" : false, "title" : qsTrId("food-figure"), "listInputText":  qsTrId("food-figure-text")}},
            {text: qsTrId("food-remorse"), file: "SwipeItems.qml", pushProperties: {"withDescription" : false, "title" :  qsTrId("food-remorse"), "listInputText":  qsTrId("food-tips-text")}},
            {text: qsTrId("food-overeat"), file: "SwipeItems.qml", pushProperties: {"withDescription" : false, "title" : qsTrId("food-overeat"), "listInputText":  qsTrId("food-overeat-text")}},
            {text: qsTrId("food-vomit"), file: "SwipeItems.qml", pushProperties: {"withDescription" : false, "title" : qsTrId("food-vomit"), "listInputText":   qsTrId("food-vomit-text")}},
            {text: qsTrId("food-fail"), file: "SwipeItems.qml", pushProperties: {"withDescription" : false, "title" : qsTrId("food-fail"), "listInputText":   qsTrId("food-fail-text")}},
            {text: qsTrId("food-misc"), file: "SwipeItems.qml", pushProperties: {"withDescription" : false, "title" : qsTrId("food-misc"), "listInputText":  qsTrId("food-misc-text")}}
            ]
}
