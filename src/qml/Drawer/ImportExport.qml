import QtQuick 2.4
import io.qt.ImporterExporter 1.0

ImportExportForm {
    property var importClicked : true

    ImporterExporter {
        id: importerExporter
    }

    importButton.onClicked: {fileDialog.selectExisting = true; fileDialog.visible = true; importClicked = true;}
    exportButton.onClicked: {fileDialog.selectExisting = false; fileDialog.visible = true; importClicked = false;}
    fileDialog.onAccepted: {(importClicked) ? importerExporter.importSettings(fileDialog.fileUrl) : importerExporter.exportSettings(fileDialog.fileUrl)}
    fileDialog.onRejected: {}
}
