import QtQuick 2.4

ClearDataForm {
    clearButton.onClicked: {dataProvider.resetInputs(reasonsClear.checked, niceClear.checked, planClear.checked, depresionPlanClear.checked, themeClear.checked); ThemeInfo.hueValue = dataProvider.loadInput("themeHue"); stackView.pop(null);}
}
