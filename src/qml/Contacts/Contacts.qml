import QtQuick 2.4
import io.qt.Translator 1.0

ContactsForm {
    Translator {
        id: translator
    }
    property var czOnly: translator.getLanguagesExcept(["CS"]);
}

