import QtQuick
import Qt.labs.platform 1.1
import io.qt.Translator 1.0

PanicForm {
    Translator {
        id: translator
    }
    property var czSkOnly: translator.getLanguagesExcept(["CS", "SK"]);
    property var relaxationFile: (dataProvider.getSystemInfo().split("|")[0] === "ios") ? StandardPaths.locate(StandardPaths.AppDataLocation, "relaxCS.mp3", StandardPaths.LocateFile) : "qrc:/audio/relaxCS.mp3";
}
