#include "importerExporter.h"
#include <QMap>
#include <QSettings>
#include <QJsonObject>
#include <QJsonDocument>
#include <QFile>
#include <iostream>
bool ImporterExporter::importSettings(QUrl fileName)
{
    QSettings settings("DontPanicDevs", "DontPanic");
    QFile file(fileName.toLocalFile());
    if(!file.open(QFile::ReadOnly | QFile::Text))
        return false;
    QJsonDocument document = QJsonDocument().fromJson(file.readAll());
    if(document.isNull())
        return false;
    QMap<QString, QVariant> content = document.object().toVariantMap();
    for (const auto &key : content.keys())
        settings.setValue(key, content.value(key));
    return true;
}

bool ImporterExporter::exportSettings(QUrl fileName)
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
    if(!file.open(QFile::WriteOnly))
        return false;
    file.write(document.toJson());
    file.close();
    return true;
}

ImporterExporter::ImporterExporter(QObject *parent) : QObject(parent)
{
}

ImporterExporter::~ImporterExporter()
{}
