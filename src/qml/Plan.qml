import QtQuick 2.4
import io.qt.UserDataProvider 1.0

PlanForm {
    UserDataProvider {
        id: dataProvider
    }

    property var questions : []
    property var arrayId : "suicidePlan"
    property var inputs : dataProvider.loadArrayInput(arrayId)

    itemList.onVisibleChanged: {
        var values = [];
        for(var i=0; i<questions.length; i++)
            values.push(itemList.itemAt(i).children[1].text);
        dataProvider.saveArrayInput(arrayId, values);
    }

    Connections {
        target: itemList
        Component.onCompleted: {
            for(var i=0; i<questions.length; i++)
                itemList.itemAt(i).children[1].text = inputs[i];
        }
    }
}
