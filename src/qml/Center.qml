import QtQuick 2.4

CenterForm {
    property var centers;
    property var keys;
    Connections {
        target: centerText
        Component.onCompleted: {
        var text = qsTrId("center-text");
        var textArray = text.split('|');
        centers = [];
        keys = [];
        for(var i=0; i<textArray.length; i++)
        {
            textArray[i] = textArray[i].trim();
            var location = textArray[i].substring(4,textArray[i].indexOf("</h2>"));
            centers[location] = textArray[i];//.push({key: location, value: textArray[i]});//
            keys[i] = location;
        }
        list.model = keys;
        centerText.text = centers[keys[0]];
    }
}

    list.onCurrentIndexChanged: {centerText.text = centers[keys[list.currentIndex]]}
}
