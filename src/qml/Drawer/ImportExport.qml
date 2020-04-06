import QtQuick 2.4
import Qt.labs.platform 1.1
import QtQml 2.14
import io.qt.ImporterExporter 1.0

ImportExportForm {
    ImporterExporter {
        id: importerExporter
    }

    importButton.onClicked: {picker.visible = true;}
    exportButton.onClicked: {validateAnimation(importerExporter.exportSettings(StandardPaths.standardLocations(StandardPaths.DownloadLocation)[0]+"/dontPanic" + new Date().toLocaleString(Qt.locale("en_EN"), "dd.MM.yyyy-hh:mm:ss") + ".json"));}
    picker.onVisibleChanged: {if(!picker.visible) {validateAnimation(importerExporter.importSettings(picker.selected));}}

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
