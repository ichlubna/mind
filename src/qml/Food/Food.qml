import QtQuick
import io.qt.Translator 1.0

FoodForm {   
    Translator {
        id: translator
    }
    property var czSkRuOnly: translator.getLanguagesExcept(["CS", "SK", "RU"]);
}
