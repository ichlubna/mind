#include "importerExporter.h"
#include <QMap>
#include <QSettings>
#include <QJsonObject>
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

QJsonDocument ImporterExporter::createJson()
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
    return document;
}

QString ImporterExporter::getText()
{
    return QString::fromStdString(createJson().toJson().toStdString());
}

bool ImporterExporter::exportSettings(QUrl fileName)
{
    QFile file(fileName.toLocalFile());
    if(!file.open(QFile::WriteOnly | QFile::Text))
        return false;
    file.write(createJson().toJson());
    file.close();
    return true;
}

ImporterExporter::ImporterExporter(QObject *parent) : QObject(parent)
{
}

ImporterExporter::~ImporterExporter()
{}
