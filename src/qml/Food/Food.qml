import QtQuick 2.4
import io.qt.Translator 1.0

FoodForm {   
    Translator {
        id: translator
    }
    property var czSkRuOnly: translator.getLanguagesExcept(["CZ", "SK", "RU"]);
}
