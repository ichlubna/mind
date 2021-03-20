import QtQuick 2.4
import "../.."

Menu{
    title: qsTrId("food-dishes")
    items: [{text: qsTrId("food-breakfast"), file: "ItemList.qml",  pushProperties: {"title" : qsTrId("food-breakfast"), "contentString" : qsTrId("food-dishes-breakfast"), "imagePattern" : "/images/anabell/breakfast*.jpg"}},
            {text: qsTrId("food-am-snack"), file: "ItemList.qml",  pushProperties: {"title" : qsTrId("food-am-snack"), "contentString" : qsTrId("food-dishes-am-snack"), "imagePattern" : "/images/anabell/amSnack*.jpg"}},
            {text: qsTrId("food-lunch"), file: "ItemList.qml",  pushProperties: {"title" : qsTrId("food-lunch"), "contentString" : qsTrId("food-dishes-lunch"), "imagePattern" : "/images/anabell/lunch*.jpg"}},
            {text: qsTrId("food-pm-snack"), file: "ItemList.qml",  pushProperties: {"title" : qsTrId("food-pm-snack"), "contentString" : qsTrId("food-dishes-pm-snack"), "imagePattern" : "/images/anabell/pmSnack*.jpg"}},
            {text: qsTrId("food-dinner"), file: "ItemList.qml",  pushProperties: {"title" : qsTrId("food-dinner"), "contentString" : qsTrId("food-dishes-dinner"), "imagePattern" : "/images/anabell/dinner*.jpg"}}
            ]
}

