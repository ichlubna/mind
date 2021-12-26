import QtQuick
import Qt.labs.platform
import QtQml 2.14
import io.qt.ImporterExporter 1.0

ImportExportForm {
    property var importClicked : true

    ImporterExporter {
        id: importerExporter
    }

    importButton.onClicked: {picker.show(); picker.dirsOnly = false; importClicked = true;}
    exportButton.onClicked: {picker.show(); picker.dirsOnly = true; importClicked = false;}
    picker.onVisibleChanged: {
            if(!picker.visible)
                if(importClicked)
                    validateAnimation(importerExporter.importSettings(picker.selectedConfirmed));
                else
                    validateAnimation(importerExporter.exportSettings(picker.selectedConfirmed + "/DontPanicBackup" + new Date().toLocaleString(Qt.locale("en_EN"), "dd-MM-yyyy_hh-mm-ss") + ".txt"));
        }

    OpacityAnimator {
         id: animator
         target: anim;
         from: 0.7;
         to: 0.0;
         duration: 1500
         running: false
    }

    function validateAnimation(ok)
    {
        if(ok)
            anim.source = "qrc:/images/tick.svg";
        else
            anim.source = "qrc:/images/delete.svg";

       animator.start();
    }
}
