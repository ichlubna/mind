import QtQuick
import io.qt.ImporterExporter 1.0

ViewDataForm {
    ImporterExporter {
        id: importerExporter
    }

    Connections {
        target: viewText
        Component.onCompleted: {
            viewText.text = importerExporter.getText();
        }}

        copyButton.onClicked:{
            viewText.selectAll();
            viewText.copy();
        }
}
