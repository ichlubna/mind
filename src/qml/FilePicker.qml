import QtQuick 2.14
import QtQuick.Controls 2.14
import Qt.labs.folderlistmodel 2.14
import Qt.labs.platform 1.1

SwipePage {
    id: picker
    z: 5000
    anchors.fill: parent
    property var filter: "*"
    property var startDir: StandardPaths.standardLocations(StandardPaths.DownloadLocation)[0]
    property var selected: startDir
    property var selectedConfirmed: ""
    property var dirsOnly: false

    function show()
    {
        picker.visible = true;
        selectedConfirmed = "";
    }

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
            onClicked: {
                selectedConfirmed = selected;
                picker.visible = false;
            }
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
        height: parent.height*0.08
        width: parent.height*0.08
        font.pointSize: 25
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
            onFolderChanged: {
                folderName.text = folder.toLocaleString().split('\\').pop().split('/').pop();
                selected = folder;
            }
            showDirsFirst: true
            showFiles: !dirsOnly
            folder: startDir
            nameFilters: filter
        }

       delegate: Component {
            DescriptionLabel {
                minimumPointSize: 10
                fontSizeMode: Text.Fit
                text: fileName
                width: list.width
                height: list.height * 0.1
                font.bold: fileIsDir
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        list.currentIndex = index;
                        selected = fileURL;
                        if(fileIsDir)
                            folderModel.folder = fileURL;
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
