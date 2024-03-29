#include <QDate>
#include <QSysInfo>
#include "userdataprovider.h"
#include "translator.h"

const std::vector<UserDataProvider::CustomInput> UserDataProvider::customInputs{{"reasons-example", "reasons", UserDataProvider::CustomInput::ARRAY},
                                                                        {"custom-write", "customWrite", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-write-body", "customWriteBody", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-ppl", "customPpl", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-do", "customDo", UserDataProvider::CustomInput::STRING},
                                                                        {"custom-go", "customGo", UserDataProvider::CustomInput::STRING},
                                                                        {"plan-example", "plan", UserDataProvider::CustomInput::ARRAY},
                                                                        {"nice-example", "nice", UserDataProvider::CustomInput::ARRAY},
                                                                        {"myContactsNames-example", "myContactsNames", UserDataProvider::CustomInput::ARRAY},
                                                                        {"myContactsNumbers-example", "myContactsNumbers", UserDataProvider::CustomInput::ARRAY},
                                                                        {"praise-example", "praise", UserDataProvider::CustomInput::ARRAY},
                                                                        {"food-creative-text", "foodCreative", UserDataProvider::CustomInput::ARRAY},
                                                                        {"food-challenge-text", "foodChallenge", UserDataProvider::CustomInput::ARRAY},
                                                                        {"suicide-plan-text", "suicidePlan", UserDataProvider::CustomInput::ARRAY}
                                                                       };

const char* UserDataProvider::TO_TRANSLATE{"###STARGATE_RULEZ###"};

QString UserDataProvider::getSystemInfo()
{
    return QSysInfo::productType() + "|" + QSysInfo::productVersion();
}

UserDataProvider::UserDataProvider(QObject *parent) : QObject(parent), settings("DontPanicDevs", "DontPanic")
{
}

QList<QString> UserDataProvider::parseList(QString input)
{
    auto list = input.split("\n");
    for(int i=0; i<list.size(); i++)
        list[i] = list[i].trimmed();
    return std::move(list);
}
#include <iostream>
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

           //TODO fix this case
           if(input.settingsId.toStdString() == "suicidePlan")
             originalValues = QList<QString>{
                     qtTrId("custom-write"),
                     qtTrId("custom-write-body"),
                     qtTrId("custom-do"),
                     qtTrId("custom-go"),
                     qtTrId("custom-ppl")
             };

           if(values.empty() || originalValues.empty())
               return;

          for (auto &value : values)
          {
               int origIndex = originalValues.indexOf(value);
               if(origIndex != -1)
                    value = QString::number(origIndex).rightJustified(2,'0')+TO_TRANSLATE;
           }
          saveArrayInput(input.settingsId, values);
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
            QList<QString> values = loadArrayInput(input.settingsId);
            auto originalValues = parseList(qtTrId(std::string(input.trId.toStdString()).c_str()));

            //TODO fix this case
            if(input.settingsId.toStdString() == "suicidePlan")
            originalValues = QList<QString>{
                        qtTrId("custom-write"),
                        qtTrId("custom-write-body"),
                        qtTrId("custom-do"),
                        qtTrId("custom-go"),
                        qtTrId("custom-ppl")
                };

            if(values.empty() || originalValues.empty())
                return;

            for (auto &value : values)
                if(value.contains(TO_TRANSLATE))
                    value = originalValues[QStringView{value}.left(2).toInt()].trimmed();
            saveArrayInput(input.settingsId, values);
         break;
    }
}

void UserDataProvider::setLanguage(QString language)
{
    for(const auto &input : customInputs)
        checkDefault(input);

    settings.setValue("language", language);
}

void UserDataProvider::translateInputs()
{
    for(const auto &input : customInputs)
        translateDefault(input);
}

void UserDataProvider::initCheck()
{
    bool reset = true;
    if(settings.contains("moods") || settings.contains("diaryRecords") || settings.contains("selfHarmExist"))
        reset = false;
    for(const auto &input : customInputs)
        if(settings.contains(input.settingsId))
            reset = false;
    if(reset)
    {
        auto params = QVector<bool>(resetParameter::RESET_PARAMS_COUNT, true);
        resetInputs(params.toList());
    }

    if(!settings.contains("notificationsOn"))
        saveBoolInput("notificationsOn", false);
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

//expecting diary array sorted by date with new records at the end
int UserDataProvider::addToSortedArray(QString id, QString value, int index)
{
    auto values = loadArrayInput(id);
    int position = 0;
    if(values.empty())
        values.append(value);
    else if(index>=values.size() || index<0)
    {
        auto newDate = QDate::fromString(value.split("|")[0], "d.M.yyyy");
        int i;
        for(i=values.size()-1; i>=0; i--)
        {
            auto date = QDate::fromString(values[i].split("|")[0], "d.M.yyyy");
            if(newDate>=date)
                break;
        }
        position = i+1;
        values.insert(position, value);
    }
    else
    {
        values[index]=value;
        position = index;
    }
    saveArrayInput(id,values);
    return position;
}

void UserDataProvider::removeFromArray(QString id, int index)
{
    auto values = loadArrayInput(id);
    values.removeAt(index);
    saveArrayInput(id,values);
}

int UserDataProvider::getIndexByDate(QString id, QString date)
{
    auto values = loadArrayInput(id);
    auto newDate = QDate::fromString(date, "d.M.yyyy");
    int index = -1;
    if(!values.empty())
        for(int i=values.size()-1; i>=0; i--)
        {
            auto searchDate = QDate::fromString(values[i].split("|")[0], "d.M.yyyy");
            if(newDate == searchDate)
            {
                index = i;
                break;
            }
            else if(newDate>searchDate)
                break;
        }
    return index;
}

QString UserDataProvider::getFromArray(QString id, int index)
{
    int size = settings.beginReadArray(id);
    if(index>=size)
        return "";
    settings.setArrayIndex(index);
    QString result = settings.value("value").toString();
    settings.endArray();
    return result;

}

void UserDataProvider::sortDiary(QString id)
{
    auto values = loadArrayInput(id);
    values.sort();
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
    {
        auto params = QVector<bool>(resetParameter::RESET_PARAMS_COUNT, false);
        params[resetParameter::LANGUAGE] = true;
        resetInputs(params.toList());
    }
    return settings.value("language").toString();
}


bool UserDataProvider::exists(QString id)
{
    return settings.contains(id);
}

QList<QString> UserDataProvider::loadArrayInput(QString id)
{
    int size = settings.beginReadArray(id);
    QList<QString> values(size);
    for (int i = 0; i < size; ++i) {
        settings.setArrayIndex(i);
        values[i]=settings.value("value").toString();
    }
    settings.endArray();
    return values;
}

bool isEntryValid(QString entry, int month, int year)
{
  if (entry == "")
    return false;
  entry.truncate(entry.indexOf('|', 8));
  auto dateValues = entry.split('.');
  if(dateValues[1].toInt() == month && dateValues[2].toInt() == year)
    return true;
  else
    return false;
}

bool isEntryLower(QString entry, int month, int year)
{
    if (entry == "")
      return false;
    entry.truncate(entry.indexOf('|', 8));
    auto dateValues = entry.split('.');
    if(dateValues[2].toInt() < year)
        return true;
    else if(dateValues[1].toInt() < month)
      return true;
    else
      return false;
}

int UserDataProvider::findOccurence(QString id, int month, int year) {
    int start=0;
    int size = settings.beginReadArray(id);
    int end=size-1;
    while (start<=end){
        int mid=floor((start + end)/2);
        settings.setArrayIndex(mid);
        auto value = settings.value("value").toString();
        if(isEntryValid(value, month, year))
        {
            settings.endArray();
            return mid;
        }

        else if (isEntryLower(value, month, year))
             start = mid + 1;
        else
             end = mid - 1;
    }
    settings.endArray();
    return -1;
}

std::pair<int, int> UserDataProvider::findRange(QString id, int month, int year, int initial)
{
     std::pair range{0,0};
     if(initial<0) return range;
     int i = initial;
     int size = settings.beginReadArray(id);

     settings.setArrayIndex(i);
     auto value = settings.value("value").toString();
     while(isEntryValid(value, month, year) && i<size)
     {
         settings.setArrayIndex(i);
         value = settings.value("value").toString();
         i++;
     }
     range.second = i-1;

     i = initial;
     settings.setArrayIndex(i);
     value = settings.value("value").toString();
     while(isEntryValid(value, month, year) && i>-1)
     {
         settings.setArrayIndex(i);
         value = settings.value("value").toString();
         i--;
     }
     range.first = i+1;
     settings.endArray();
     return range;
}

QList<QString> UserDataProvider::loadArrayInputMonth(QString id, int month, int year)
{
    auto range = findRange(id, month, year, findOccurence(id, month, year));
    settings.beginReadArray(id);
    QList<QString> values(range.second-range.first);
    int j = 0;
    for (int i = range.first; i < range.second; i++) {
        settings.setArrayIndex(i);
        values[j]=settings.value("value").toString();
        j++;
    }
    settings.endArray();
    return values;
}

void UserDataProvider::resetInputs(QList<bool> params)
{
    if(params[resetParameter::REASONS])
    {
        auto list = parseList(qtTrId("reasons-example"));
        saveArrayInput("reasons", list);
    }
    if(params[resetParameter::SUICIDE_PLAN])
    {
        auto list = QList<QString>{
                qtTrId("custom-write"),
                qtTrId("custom-write-body"),
                qtTrId("custom-do"),
                qtTrId("custom-go"),
                qtTrId("custom-ppl")
        };

        saveArrayInput("suicidePlan", list);
    }
    if(params[resetParameter::DEPRESSION_PLAN])
    {
        saveArrayInput("plan", QList<QString>{qtTrId("plan-example")});
        saveArrayInput("planC", QList<QString>{"t"});
    }
    if(params[resetParameter::DEPRESSION_NICE])
        saveArrayInput("nice", QList<QString>{qtTrId("nice-example")});
    if(params[resetParameter::DEPRESSION_PRAISE])
        saveArrayInput("praise", QList<QString>{qtTrId("praise-example")});
    if(params[resetParameter::CUSTOM_THEME])
    {
        settings.setValue("themeLight",  -0.05);
        settings.setValue("themeHue",  0.76);
    }
    if(params[resetParameter::DEPRESSION_MOOD])
    {
        saveArrayInput("moods", QList<QString>{});
    }
    if(params[resetParameter::LANGUAGE])
    {
        QLocale::Language language = QLocale::system().language();
        QString langString = "EN";
        auto languages = TranslatorAdapter::getLanguages();
        auto languagesLocale = TranslatorAdapter::getLanguagesLocale();
        for(int i=0; i<languagesLocale.length(); i++)
            if(language == languagesLocale[i])
                langString = languages[i];
        settings.setValue("language", langString);
    }
    if(params[resetParameter::FOOD])
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
    if(params[resetParameter::MY_CONTACTS])
    {
        auto list = parseList(qtTrId("myContactsNames-example"));
        saveArrayInput("myContactsNames", list);

        list = parseList(qtTrId("myContactsNumbers-example"));
        saveArrayInput("myContactsNumbers", list);
    }

    if(params[resetParameter::DIARY])
    {
        QList<QString> list;
        saveArrayInput("diaryRecords", list);
    }

    if(params[resetParameter::FOOD_RECORDS])
    {
        std::vector<QString> foodArrays{"foodRecordDates", "foodRecordBreakfast", "foodRecordAmSnack", "foodRecordLunch", "foodRecordPmSnack", "foodRecordDinner", "foodRecordSecondDinner"};
        QList<QString> list;
        for(auto const& array : foodArrays)
            saveArrayInput(array, list);
    }

    if(params[resetParameter::SELF_HARM_HELPED])
    {
        saveArrayInput("selfHarmHelped", QList<QString>{""});
    }

    if(params[resetParameter::SELF_HARM_PLAN])
    {
        saveArrayInput("selfHarmPlan", QList<QString>{"", "", "", ""});
    }

    if(params[resetParameter::SELF_HARM_TIMER])
    {
        saveBoolInput("selfHarmTimer", false);
        saveIntInput("selfHarmTimerRecord", 0);
    }

    if(params[resetParameter::CONTACT_MESSAGE])
    {
        saveInput("contactMessageAddress", "");
        saveInput("contactMessageBody", "");
    }
    if(params[resetParameter::SLEEP])
    {
        saveArrayInput("sleep", QList<QString>{});
    }
}

