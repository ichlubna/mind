import QtQuick
import '..'

CustomThemeForm {
     hueSlider.onValueChanged: {ThemeInfo.hueValue = hueSlider.value; dataProvider.saveInput("themeHue", hueSlider.value);}
     lightSlider.onValueChanged: {ThemeInfo.backgroundLightness = lightSlider.value; dataProvider.saveInput("themeLight", lightSlider.value);}
}
