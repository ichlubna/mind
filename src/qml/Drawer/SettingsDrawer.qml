import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 
import io.qt.UserDataProvider
import io.qt.Translator
import Qt5Compat.GraphicalEffects
import ".."

//TODO to separate file
Drawer {
    width: window.width * 0.66
    height: window.height
    font.pointSize: 14
    z: 10
    background: Rectangle {
        id: bckg
        color: "#9a9a9a"
        visible: false
    }
    Colorize {
        anchors.fill: parent
        source: bckg
        hue: ThemeInfo.hueValue
        saturation: 0.6
        lightness: ThemeInfo.backgroundLightness - ThemeInfo.elementSubtractor
        opacity: 0.27
    }

    ScrollView {
        id: view
        anchors.fill: parent
        contentWidth: -1
        contentHeight: drawerItems.height
        clip: true
        anchors.margins: 10

    Column {
        id: drawerItems

        ItemDelegate {
            text: qsTrId("resetInputs")
            width: parent.width
            onClicked: {
                stackView.push("ClearData.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTrId("contactUs")
            width: parent.width
            onClicked: {
                stackView.push("ContactUs.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTrId("rate")
            width: parent.width
            onClicked: {
                drawer.close()
                if (Qt.platform.os == "ios")
                    Qt.openUrlExternally(
                                "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1459513911&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software")
                else
                    Qt.openUrlExternally(
                                "https://play.google.com/store/apps/details?id=org.dontpanic")
            }
        }

        ItemDelegate {
            text: qsTrId("support")
            width: parent.width
            onClicked: {
                stackView.push("Support.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTrId("custom-theme")
            width: parent.width
            onClicked: {
                stackView.push("CustomTheme.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTrId("aboutApp")
            width: parent.width
            onClicked: {
                stackView.push("AboutApp.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTrId("import-export")
            width: parent.width
            onClicked: {
                stackView.pop(null);
                stackView.push("ImportExport.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTrId("support-us")
            width: parent.width
            onClicked: {
                drawer.close()
                if (dataProvider.loadLanguage() === "CS" || dataProvider.loadLanguage() === "SK")
                    Qt.openUrlExternally("https://www.darujme.cz/projekt/1203622")
                else
                    Qt.openUrlExternally("https://www.darujme.cz/projekt/1203622?locale=en")
            }
        }

        ItemDelegate {
            text: qsTrId("exit")
            width: parent.width
            onClicked: {
                Qt.quit()
            }
        }

        LineDelimiter{
            height: 5
            width: drawer.width}

        GridLayout {
            columns: 3
            width: drawer.width
                RoundButton {
                    background: Image {
                        source: "qrc:/images/fb.svg"
                    }
                    onClicked: {Qt.openUrlExternally("https://www.facebook.com/aplikacenepanikar/"); drawer.close()}
                    Layout.maximumWidth: drawer.width*0.2
                    Layout.maximumHeight: drawer.width*0.2
                    Layout.topMargin: 20
                    Layout.margins: 10
                }

                RoundButton {
                    background: Image {
                        source: "qrc:/images/instagram.svg"
                    }
                    onClicked: {Qt.openUrlExternally("https://www.instagram.com/aplikace_nepanikar"); drawer.close()}
                    Layout.maximumWidth: drawer.width*0.2
                    Layout.maximumHeight: drawer.width*0.2
                    Layout.topMargin: 20
                    Layout.margins: 10
                }

                RoundButton {
                    background: Image {
                        source: "qrc:/images/web.svg"
                    }
                    onClicked: {Qt.openUrlExternally("https://nepanikar.eu"); drawer.close()}
                    Layout.maximumWidth: drawer.width*0.2
                    Layout.maximumHeight: drawer.width*0.2
                    Layout.topMargin: 20
                    Layout.margins: 10
                }
        }

        LineDelimiter{
            height: 5
            width: drawer.width}

        GridLayout {
            columns: 3
            width: drawer.width
            Repeater{
                property string currentLanguage: dataProvider.loadLanguage()
                id: languageList
                model: 0
                RoundButton {
                    property string language: "EN"
                    background: Image {
                        source: "qrc:/images/"+language+".svg"
                    }
                    onClicked: {stackView.pop(null); drawer.close(); dataProvider.setLanguage(language); translator.changeLanguage(language); dataProvider.translateInputs(); languageList.currentLanguage = dataProvider.loadLanguage();}
                    Layout.maximumWidth: drawer.width*0.2
                    Layout.maximumHeight: drawer.width*0.2
                    Layout.topMargin: 20
                    Layout.margins: 10
                    opacity: (languageList.currentLanguage === language) ? 1.0 : 0.5
                }
            }
        }
    }
}
    Connections{
        target: languageList
         Component.onCompleted: {
             var languages = translator.getLanguages();
             languageList.model = languages.length;
             for (var i = 0; i < languages.length; i++) {
                 languageList.itemAt(i).language = languages[i];
            }
    }}

    onOpened: {showBlur();}
    onClosed: {hideBlur();}
}

