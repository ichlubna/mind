#ifndef IMPORTEREXPORTER_H
#define IMPORTEREXPORTER_H
#include <QObject>
#include <QUrl>

class ImporterExporter : public QObject
{
    Q_OBJECT
public:
    explicit ImporterExporter(QObject *parent = nullptr);
    ~ImporterExporter();
    Q_INVOKABLE static void importSettings(QUrl fileName);
    Q_INVOKABLE static void exportSettings(QUrl fileName);
private:
};

#endif // IMPORTEREXPORTER_H
