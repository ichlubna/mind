import QtQuick 2.14
import QtQuick.Controls 2.14
import Qt.labs.folderlistmodel 2.14
import Qt.labs.platform 1.1

SwipePage {
    id: picker
    z: 5000
    anchors.fill: parent
    property var filter: "*"
    property var selected: ""

    Image {
        id: ok
        source: "qrc:/images/tick.svg"
        height: parent.height*0.09
        width: parent.height*0.09
        fillMode: Image.PreserveAspectFit
        anchors.top: parent.top
        anchors.right: parent.right
        MouseArea {
            anchors.fill: parent
            onClicked: {picker.visible = false;}
        }
    }

    DescriptionLabel {
        id: folderName
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: folderModel.folder.toLocaleString().split('\\').pop().split('/').pop();
    }

    DescriptionLabel {
        anchors.top: parent.top
        anchors.left: parent.left
        text: ".."
        height: parent.height*0.09
        width: parent.height*0.09
        font.pointSize: 30
        MouseArea {
            anchors.fill: parent
            onClicked: {folderModel.folder = folderModel.parentFolder}
        }
    }

    ListView {
        id: list
        anchors.top: ok.bottom
        width: parent.width
        height: parent.height*0.8
        clip: true
        ScrollBar.vertical: ScrollBar {
            active: true
            policy: ScrollBar.AsNeeded
        }
        highlightFollowsCurrentItem: false

        model: FolderListModel {
            id: folderModel
            onFolderChanged: {folderName.text = folder.toLocaleString().split('\\').pop().split('/').pop();}
            showDirsFirst: true
            folder: StandardPaths.standardLocations(
                        StandardPaths.DownloadLocation)[0]
                        nameFilters: filter
        }

       delegate: Component {
            DescriptionLabel {
                text: fileName
                width: list.width
                height: list.height * 0.1
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        list.currentIndex = index;
                        if(fileIsDir)
                            folderModel.folder = fileURL;
                        else
                            selected = fileURL;
                    }
                }
            }
        }

       highlight: Rectangle {
               color: "#30000000"
               width: list.width
               height: list.height * 0.1
                 y: list.currentItem.y
           }

    }
}
