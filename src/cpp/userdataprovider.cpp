#include <QApplication>
#include <QTranslator>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "userdataprovider.h"

//TODO use in reset funciton too
const std::vector<UserDataProvider::CustomInput> UserDataProvider::customInputs{{"my-reasons", "myReasons", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-write", "customWrite", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-write-body", "customWriteBody", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-ppl", "customPpl", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-do", "customDo", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-go", "customGo", UserDataProvider::CustomInput::STRING},
                                                                        {"plan-example", "plan", UserDataProvider::CustomInput::ARRAY},
                                                                        {"nice-example", "nice", UserDataProvider::CustomInput::ARRAY}
                                                                       };

const char* UserDataProvider::TO_TRANSLATE{"###STARGATE_RULEZ###"};

UserDataProvider::UserDataProvider(QObject *parent) : QObject(parent), settings("DontPanicDevs", "DontPanic")
{
}
#include<iostream>
void UserDataProvider::checkDefault(UserDataProvider::CustomInput input)
{
   switch(input.type)
   {
        case CustomInput::STRING:
            if(loadInput(input.settingsId) == qtTrId(input.trId.toStdString().c_str()))
                saveInput(input.settingsId, TO_TRANSLATE);
        break;

        case CustomInput::ARRAY:
           QList<QString> values = loadArrayInput(input.settingsId);
           if(values.empty())
               return;
           if(values[0] == qtTrId(std::string(input.trId.toStdString()).c_str()))
           {
               settings.beginWriteArray(input.settingsId);
               settings.setArrayIndex(0);
               settings.setValue("value",TO_TRANSLATE);
               settings.endArray();
           }
        break;
   }
}

void UserDataProvider::translateDefault(CustomInput input)
{
    switch(input.type)
    {
         case CustomInput::STRING:
             if(loadInput(input.settingsId) == TO_TRANSLATE)
                 saveInput(input.settingsId, qtTrId(input.trId.toStdString().c_str()));
         break;

        case CustomInput::ARRAY:
            QList<QString>  values = loadArrayInput(input.settingsId);
            if(values.empty())
                return;
            if(values[0] == TO_TRANSLATE)
            {
                settings.beginWriteArray(input.settingsId);
                settings.setArrayIndex(0);
                settings.setValue("value",qtTrId(std::string(input.trId.toStdString()).c_str()));
                settings.endArray();
            }
         break;
    }
}

void UserDataProvider::initCheck()
{
    //reset to default values if first run
    if(!settings.contains("myReasons"))
       resetInputs(true, true, true, true, true, true, true, true);
    //to avoid getting red color when updating to version with color change option
    if(!settings.contains("themeLight"))
    {
        settings.setValue("themeLight",  -0.05);
        settings.setValue("themeHue",  0.76);
    }

    //food update
    if(!settings.contains("foodLike"))
    {
        resetInputs(false,false,false,false,false,false,false,true);
    }


    for(const auto &input : customInputs)
        translateDefault(input);
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

QString UserDataProvider::loadLanguage()
{
    if (!settings.contains("language"))
        return QString("UNKNOWN");
    else
        return settings.value("language").toString();
}


bool UserDataProvider::exists(QString id)
{
    return settings.contains(id);
}

void UserDataProvider::setLanguage(QString language)
{
    for(const auto &input : customInputs)
        checkDefault(input);

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

void UserDataProvider::resetInputs(bool reasons, bool nice, bool plan, bool depressionPlan, bool theme, bool moods, bool language, bool foodTasks)
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
    {
        saveArrayInput("moods", QList<QString>{});
        /*settings.remove("moodsRangeStart");
        settings.remove("moodsRangeEnd");*/
    }
    if(language)
        settings.remove("language");
    if(foodTasks)
    {
        QList<QString> list = qtTrId("food-afraid-text").split("|");
        QList<QString> checkList;
        for(int i=0; i<list.size(); i++)
        {
            checkList.push_back("f");
            list[i] = list[i].trimmed();
        }
        saveArrayInput("foodAfraid", list);
        saveArrayInput("foodAfraidC", checkList);

        list = qtTrId("food-challenge-text").split("|");
        checkList.clear();
        for(int i=0; i<list.size(); i++)
        {
            checkList.push_back("f");
            list[i] = list[i].trimmed();
        }
        saveArrayInput("foodChallenge", list);
        saveArrayInput("foodChallengeC", checkList);

        list = qtTrId("food-creative-text").split("|");
        checkList.clear();
        for(int i=0; i<list.size(); i++)
        {
            checkList.push_back("f");
            list[i] = list[i].trimmed();
        }
        saveArrayInput("foodCreative", list);
        saveArrayInput("foodCreativeC", checkList);

        list = qtTrId("food-food-like-text").split("|");
        checkList.clear();
        for(int i=0; i<list.size(); i++)
        {
            checkList.push_back("f");
            list[i] = list[i].trimmed();
        }
        saveArrayInput("foodFoodLike", list);
        saveArrayInput("foodFoodLikeC", checkList);

        list = qtTrId("food-like-text").split("|");
        checkList.clear();
        for(int i=0; i<list.size(); i++)
        {
            checkList.push_back("f");
            list[i] = list[i].trimmed();
        }
        saveArrayInput("foodLike", list);
        saveArrayInput("foodLikeC", checkList);

        list = qtTrId("food-motivation-text").split("|");
        checkList.clear();
        for(int i=0; i<list.size(); i++)
        {
            checkList.push_back("f");
            list[i] = list[i].trimmed();
        }
        saveArrayInput("foodMotivation", list);
        saveArrayInput("foodMotivationC", checkList);
    }
}

