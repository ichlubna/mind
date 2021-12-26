import QtQuick
import io.qt.Translator

DistractionForm {
    Translator {
        id: translator
    }
    property var czSkOnly: translator.getLanguagesExcept(["CS", "SK"]);
}
