import QtQuick
import io.qt.Translator

FoodForm {   
    Translator {
        id: translator
    }
    property var czSkRuOnly: translator.getLanguagesExcept(["CS", "SK", "RU"]);
}
