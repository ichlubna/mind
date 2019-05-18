import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.2
import '.'

Page {
    visible: true
    background: Image {
        id: bckg
        source: "qrc:/images/background2.svg"
        smooth: true
        antialiasing: true
        visible: false
    }
    Colorize {
        anchors.fill: parent
        source: bckg
        hue: ThemeInfo.hueValue
        saturation: 0.65
        lightness: ThemeInfo.backgroundLightness
    }
}
