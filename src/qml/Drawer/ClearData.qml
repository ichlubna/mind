import QtQuick 2.4
import ".."

ClearDataForm {
    clearButton.onClicked: {dataProvider.resetInputs(reasonsClear.checked, niceClear.checked, planClear.checked, depresionPlanClear.checked, themeClear.checked, moodsClear.checked, languageClear.checked, foodTasksClear.checked, depressionPraiseClear.checked);
                            ThemeInfo.hueValue = dataProvider.loadInput("themeHue");
                            ThemeInfo.backgroundLightness = dataProvider.loadInput("themeLight");
                            stackView.pop(null);}
}
