import QtQuick 2.4
import io.qt.ImporterExporter 1.0

ImportExportForm {
    property var importClicked : true
    property var ok : true

    ImporterExporter {
        id: importerExporter
    }

    importButton.onClicked: {fileDialog.selectExisting = true; fileDialog.visible = true; importClicked = true;}
    exportButton.onClicked: {fileDialog.selectExisting = false; fileDialog.visible = true; importClicked = false;}
    fileDialog.onAccepted: {(importClicked) ? ok = importerExporter.importSettings(fileDialog.fileUrl) : ok = importerExporter.exportSettings(fileDialog.fileUrl); validateAnimation();}
    fileDialog.onRejected: {}

    OpacityAnimator {
         id: animator
         target: anim;
         from: 0.7;
         to: 0.0;
         duration: 1500
         running: false
    }

    function validateAnimation()
    {
        if(ok)
            anim.source = "qrc:/images/tick.svg";
        else
            anim.source = "qrc:/images/delete.svg";

       animator.start();
    }
}
