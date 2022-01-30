import QtQuick
import io.qt.UserDataProvider

PlanForm {
    UserDataProvider {
        id: dataProvider
    }

    property var questions : []
    property string arrayId : "suicidePlan"
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
            questions = questions.filter(function(value, index, arr){return value!==""})
            for(var i=0; i<questions.length; i++)
                itemList.itemAt(i).children[1].text = inputs[i];
        }
    }
}
