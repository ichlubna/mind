import QtQuick 2.4
import ".."

ClearDataForm {
    clearButton.onClicked: {
        var params = []
        for(var i=0; i<clearList.count; i++)
        {
                params.push(clearList.itemAt(i).children[1].checked);
        }
        dataProvider.resetInputs(params);
        ThemeInfo.hueValue = dataProvider.loadInput("themeHue");
        ThemeInfo.backgroundLightness = dataProvider.loadInput("themeLight");
        stackView.pop(null);
    }

    allButton.onClicked: {
        for(var i=0; i<clearList.count; i++)
        {
                clearList.itemAt(i).children[1].checked = true;
        }
    }

    Connections {
        target: clearList
        Component.onCompleted: {
            for (var i = 0; i < clearList.count; i++)
                if(i%2==0)
                    clearList.itemAt(i).children[0].text = clearList.itemAt(i).children[0].text.replace("<br>", " ")
        }
}
}
