import QtQuick
import io.qt.Translator

ContactsForm {
    Translator {
        id: translator
    }
    property var czOnly: translator.getLanguagesExcept(["CS"]);
    property var czSkOnly: translator.getLanguagesExcept(["CS", "SK"]);
}

