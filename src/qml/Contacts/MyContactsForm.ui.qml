import QtQuick.Controls 2.5
import ".."

ArrayUpdater {
    title: qsTrId("my-contacts")
    arrayNames: ["myContactsNames", "myContactsNumbers"]
    type: "C"
    headerText: qsTrId("my-contacts-header")
}
