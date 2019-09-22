#include <QApplication>
#include <QTranslator>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "userdataprovider.h"

//TODO use in reset function too
const std::vector<UserDataProvider::CustomInput> UserDataProvider::customInputs{{"my-reasons", "myReasons", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-write", "customWrite", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-write-body", "customWriteBody", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-ppl", "customPpl", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-do", "customDo", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-go", "customGo", UserDataProvider::CustomInput::STRING},
                                                                        {"plan-example", "plan", UserDataProvider::CustomInput::ARRAY},
                                                                        {"nice-example", "nice", UserDataProvider::CustomInput::ARRAY},
                                                                        {"food-creative-text", "foodCreative", UserDataProvider::CustomInput::ARRAY},
                                                                        {"food-challenge-text", "foodChallenge", UserDataProvider::CustomInput::ARRAY}
                                                                       };

const char* UserDataProvider::TO_TRANSLATE{"###STARGATE_RULEZ###"};

UserDataProvider::UserDataProvider(QObject *parent) : QObject(parent), settings("DontPanicDevs", "DontPanic")
{
}

QList<QString> UserDataProvider::parseList(QString input)
{
    auto list = input.split("|");
    for(int i=0; i<list.size(); i++)
        list[i] = list[i].trimmed();
    return std::move(list);
}

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
           auto originalValues = parseList(qtTrId(std::string(input.trId.toStdString()).c_str()));
           if(values.empty() || originalValues.empty())
               return;

           settings.beginWriteArray(input.settingsId);
           for (int i = 0; i<values.size(); ++i) {
               settings.setArrayIndex(i);
               int origIndex = originalValues.indexOf(values[i]);
               if(origIndex != -1)
                        settings.setValue("value",QString::number(origIndex).rightJustified(2,'0')+TO_TRANSLATE);
           }
           settings.endArray();
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
            auto originalValues = parseList(qtTrId(std::string(input.trId.toStdString()).c_str()));
            if(values.empty() || originalValues.empty())
                return;

            settings.beginWriteArray(input.settingsId);
            for (int i = 0; i < originalValues.size() && i<values.size(); ++i) {
                settings.setArrayIndex(i);

                if(values[i].contains(TO_TRANSLATE))
                    settings.setValue("value",originalValues[QStringRef(&values[i],0,2).toInt()].trimmed());
            }
            settings.endArray();
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
    if(!settings.contains("foodExist"))
    {
        saveBoolInput("foodExist", true);
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
        auto list = parseList(qtTrId("food-afraid-text"));
        QList<QString> checkList;
        for(int i=0; i<list.size(); i++)
            checkList.push_back("f");

        saveArrayInput("foodAfraid", list);
        saveArrayInput("foodAfraidC", checkList);

        list = parseList(qtTrId("food-challenge-text"));
        checkList.clear();
        for(int i=0; i<list.size(); i++)
            checkList.push_back("f");

        saveArrayInput("foodChallenge", list);
        saveArrayInput("foodChallengeC", checkList);

        list = parseList(qtTrId("food-creative-text"));
        checkList.clear();
        for(int i=0; i<list.size(); i++)
            checkList.push_back("f");

        saveArrayInput("foodCreative", list);
        saveArrayInput("foodCreativeC", checkList);

        list = parseList(qtTrId("food-food-like-text"));
        checkList.clear();
        for(int i=0; i<list.size(); i++)
            checkList.push_back("f");

        saveArrayInput("foodFoodLike", list);
        saveArrayInput("foodFoodLikeC", checkList);

        list = parseList(qtTrId("food-like-text"));
        checkList.clear();
        for(int i=0; i<list.size(); i++)
            checkList.push_back("f");

        saveArrayInput("foodLike", list);
        saveArrayInput("foodLikeC", checkList);

        list = parseList(qtTrId("food-motivation-text"));
        checkList.clear();
        for(int i=0; i<list.size(); i++)
            checkList.push_back("f");

        saveArrayInput("foodMotivation", list);
        saveArrayInput("foodMotivationC", checkList);
    }
}

