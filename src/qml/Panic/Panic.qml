import QtQuick 2.4
import Qt.labs.platform 1.1
import io.qt.Translator 1.0

PanicForm {
    Translator {
        id: translator
    }
    property var czSkOnly: translator.getLanguagesExcept(["CZ", "SK"]);
    property var relaxationFile: (dataProvider.getSystemInfo().split("|")[0] === "ios") ? StandardPaths.locate(StandardPaths.AppDataLocation, "relaxCS.mp3", StandardPaths.LocateFile) : "qrc:/audio/relaxCS.mp3";
}
