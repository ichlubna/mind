import QtQuick 2.4

ContactUsForm {
    property var message : (dataProvider.loadLanguage() === "SK" || dataProvider.loadLanguage() === "CS") ? "" : "<br>Please write your emails in English if possible, otherwise we might not understand and reply correctly. Thank you!"

}
