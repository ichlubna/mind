import QtQuick 2.4

MenuPage {
    id: themePage
    title: qsTrId("custom-theme")
    property alias hueSlider: hueSlider
    property alias lightSlider: lightSlider

    DescriptionLabel {
        id: sliderHLabel
        text: qsTrId("theme-slider")
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
    }

    MenuSlider {
        id: hueSlider
        maximumValue: 1.0
        minimumValue: 0.0
        value: ThemeInfo.hueValue
        anchors.top: sliderHLabel.bottom
    }

    DescriptionLabel {
        id: sliderLLabel
        text: qsTrId("theme-slider-light")
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        anchors.top: hueSlider.bottom
    }

    MenuSlider {
        id: lightSlider
        maximumValue: 0.3
        minimumValue: -0.3
        value: ThemeInfo.backgroundLightness
        anchors.top: sliderLLabel.bottom
    }

}
