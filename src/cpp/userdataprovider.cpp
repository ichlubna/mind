#include "userdataprovider.h"

UserDataProvider::UserDataProvider(QObject *parent) : QObject(parent), settings("DontPanicDevs", "DontPanic")
{
    if(!settings.contains("myReasons"))
       resetInputs(true, true, true, true);
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

void UserDataProvider::resetInputs(bool reasons, bool nice, bool plan, bool depressionPlan)
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
}

