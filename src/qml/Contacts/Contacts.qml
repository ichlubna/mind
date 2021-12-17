import QtQuick
import io.qt.Translator 1.0

ContactsForm {
    Translator {
        id: translator
    }
    property var czOnly: translator.getLanguagesExcept(["CS"]);
    property var czSkOnly: translator.getLanguagesExcept(["CS", "SK"]);
}

