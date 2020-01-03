import QtQuick 2.4
import ".."

ClearDataForm {
    clearButton.onClicked: {dataProvider.resetInputs(reasonsClear.checked, niceClear.checked, planClear.checked, depresionPlanClear.checked, themeClear.checked, moodsClear.checked, languageClear.checked, foodTasksClear.checked, depressionPraiseClear.checked, myContactsClear.checked, diaryClear.checked);
                            ThemeInfo.hueValue = dataProvider.loadInput("themeHue");
                            ThemeInfo.backgroundLightness = dataProvider.loadInput("themeLight");
                            stackView.pop(null);}
    allButton.onClicked: {
        for(var i=0; i<clearList.children.length; i++)
        {
            if(i%2 == 1)
                clearList.children[i].checked = true;
        }
    }

    Connections {
        target: clearList
        Component.onCompleted: {
            for (var i = 0; i < clearList.children.length; i++)
                if(i%2==0)
                    clearList.children[i].text =clearList.children[i].text.replace("<br>", " ")
        }
}
}
