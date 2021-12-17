import QtQuick
import ".."

MenuPage {
    id: contactUsPage

    Description {
        id: contactUsText
        text: qsTrId("contact-us-text") + message
    }
}
