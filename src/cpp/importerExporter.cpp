#include "importerExporter.h"
#include <QMap>
#include <QSettings>
#include <QJsonObject>
#include <QJsonDocument>
#include <QFile>
#include <iostream>
void ImporterExporter::importSettings(QUrl fileName)
{
    QSettings settings("DontPanicDevs", "DontPanic");
    QFile file(fileName.toLocalFile());
    file.open(QFile::ReadOnly | QFile::Text);
    QMap<QString, QVariant> content = (QJsonDocument().fromJson(file.readAll())).object().toVariantMap();
    for (const auto &key : content.keys())
        settings.setValue(key, content.value(key));
}

void ImporterExporter::exportSettings(QUrl fileName)
{
    QSettings settings("DontPanicDevs", "DontPanic");
    QMap<QString, QVariant> content;
    QStringList keys = settings.allKeys();
    QStringListIterator it(keys);
    while (it.hasNext())
    {
        QString currentKey = it.next();
        content.insert(currentKey, settings.value(currentKey));
    }
    auto json = QJsonObject::fromVariantMap(content);
    QJsonDocument document;
    document.setObject(json);
    QFile file(fileName.toLocalFile());
    file.open(QFile::WriteOnly);
    file.write(document.toJson());
    //file.write("a");
    file.close();
}

ImporterExporter::ImporterExporter(QObject *parent) : QObject(parent)
{
}

ImporterExporter::~ImporterExporter()
{}
