#include <QApplication>
#include <QTranslator>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "userdataprovider.h"

UserDataProvider::UserDataProvider(QObject *parent) : QObject(parent), settings("DontPanicDevs", "DontPanic")
{
    //reset to default values if first run
    if(!settings.contains("myReasons"))
       resetInputs(true, true, true, true, true, true, true);
    //to avoid getting red color when updating to version with color change option
    if(!settings.contains("themeLight"))
    {
        settings.setValue("themeLight",  -0.05);
        settings.setValue("themeHue",  0.76);
    }
}

void UserDataProvider::saveInput(QString id, QString value)
{
    settings.setValue(id, value);
}

void UserDataProvider::saveArrayInput(QString id, QList<QString> values)
{
    settings.beginWriteArray(id);
    for (int i = 0; i < values.size(); ++i) {
        settings.setArrayIndex(i);
        settings.setValue("value",values.at(i));
    }
    settings.endArray();
}

void UserDataProvider::saveBoolInput(QString id, bool value)
{
    settings.setValue(id, value);
}

void UserDataProvider::saveIntInput(QString id, int value)
{
    settings.setValue(id, value);
}

void UserDataProvider::saveFloatInput(QString id, float value)
{
    settings.setValue(id, value);
}

QString UserDataProvider::loadInput(QString id)
{
    return settings.value(id).toString();
}

int UserDataProvider::loadIntInput(QString id)
{
    return settings.value(id).toInt();
}

bool UserDataProvider::loadBoolInput(QString id)
{
    return settings.value(id).toBool();
}

float UserDataProvider::loadFloatInput(QString id)
{
    return settings.value(id).toFloat();
}

void UserDataProvider::setLanguage(QString language)
{
    settings.setValue("language", language);
    qApp->exit(TRANSLATION_RESTART);
}

QList<QString> UserDataProvider::loadArrayInput(QString id)
{
    QList<QString> values;
    int size = settings.beginReadArray(id);
    for (int i = 0; i < size; ++i) {
        settings.setArrayIndex(i);
        values.append(settings.value("value").toString());
    }
    settings.endArray();
    return values;
}

void UserDataProvider::resetInputs(bool reasons, bool nice, bool plan, bool depressionPlan, bool theme, bool moods, bool language)
{
    if(reasons)
        settings.setValue("myReasons", qtTrId("my-reasons"));
    if(plan)
    {
        settings.setValue("customWrite", qtTrId("custom-write"));
        settings.setValue("customWriteBody", qtTrId("custom-write-body"));
        settings.setValue("customPpl", qtTrId("custom-ppl"));
        settings.setValue("customDo", qtTrId("custom-do"));
        settings.setValue("customGo", qtTrId("custom-go"));
    }
    if(depressionPlan)
    {
        saveArrayInput("plan", QList<QString>{qtTrId("plan-example")});
        saveArrayInput("planC", QList<QString>{"t"});
    }
    if(nice)
        saveArrayInput("nice", QList<QString>{qtTrId("nice-example")});
    if(theme)
    {
        settings.setValue("themeLight",  -0.05);
        settings.setValue("themeHue",  0.76);
    }
    if(moods)
        saveArrayInput("moods", QList<QString>{});
    if(language)
        settings.remove("language");
}

