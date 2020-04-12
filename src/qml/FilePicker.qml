import QtQuick 2.14
import QtQuick.Controls 2.14
import Qt.labs.folderlistmodel 2.14
import Qt.labs.platform 1.1
import io.qt.PermissionsOS 1.0

SwipePage {
    id: picker
    z: 5000
    anchors.fill: parent
    property var filter: "*"
    property var systemInfo: permissions.getSystemInfo().split("|")
    property var startDir: StandardPaths.standardLocations((systemInfo[0] === "android" && parseFloat(systemInfo[1]) >= 10.0) ? StandardPaths.AppDataLocation : StandardPaths.DownloadLocation)[0]
    property var selected: startDir
    property var selectedConfirmed: ""
    property var dirsOnly: false

    PermissionsOS{
        id: permissions
    }

    function show()
    {
        permissions.requestReadWrite();
        picker.visible = true;
        list.currentIndex = -1;
        selectedConfirmed = "";
        folderModel.folder = startDir;
        folderName.text = folderModel.folder.toString().replace(/^(file:\/{3})|(qrc:\/{2})|(http:\/{2})/,"");
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
        minimumPointSize: 10
        width: parent.width*0.9-parent.height*0.09*20.1
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
    }

    Image {
        anchors.top: parent.top
        anchors.left: parent.left
        source: "qrc:/images/folderUp.svg"
        height: parent.height*0.09
        width: parent.height*0.09
        fillMode: Image.PreserveAspectFit
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
                folderName.text = folderModel.folder.toString().replace(/^(file:\/{3})|(qrc:\/{2})|(http:\/{2})/,"");
                selected = folder;
            }
            showDirsFirst: true
            showFiles: !dirsOnly
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
