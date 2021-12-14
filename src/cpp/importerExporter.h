#ifndef IMPORTEREXPORTER_H
#define IMPORTEREXPORTER_H
#include <QObject>
#include <QUrl>
#include <QJsonDocument>

class ImporterExporter : public QObject
{
    Q_OBJECT
public:
    explicit ImporterExporter(QObject *parent = nullptr);
    ~ImporterExporter();
    Q_INVOKABLE static bool importSettings(QUrl fileName);
    Q_INVOKABLE static bool exportSettings(QUrl fileName);
    Q_INVOKABLE static QString getText();
private:
    Q_INVOKABLE static QJsonDocument createJson();
};

#endif // IMPORTEREXPORTER_H
