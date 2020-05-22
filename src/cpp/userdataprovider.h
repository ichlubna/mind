#ifndef USERDATAPROVIDER_H
#define USERDATAPROVIDER_H
#include <QApplication>
#include <QObject>
#include <QString>
#include <QSettings>
#include <QTranslator>
#include <QQmlApplicationEngine>

class UserDataProvider : public QObject
{
    Q_OBJECT
public:
    explicit UserDataProvider(QObject *parent = nullptr);
    Q_INVOKABLE void initCheck();
    Q_INVOKABLE bool exists(QString id);
    Q_INVOKABLE void saveInput(QString id, QString value);
    Q_INVOKABLE void saveBoolInput(QString id, bool value);
    Q_INVOKABLE void saveIntInput(QString id, int value);
    Q_INVOKABLE void saveFloatInput(QString id, float value);
    Q_INVOKABLE void saveArrayInput(QString id, QList<QString> values);
    Q_INVOKABLE QString loadInput(QString id);
    Q_INVOKABLE bool loadBoolInput(QString id);
    Q_INVOKABLE int loadIntInput(QString id);
    Q_INVOKABLE float loadFloatInput(QString id);
    Q_INVOKABLE QList<QString> loadArrayInput(QString id);
    Q_INVOKABLE int addToSortedArray(QString id, QString value, int index);
    Q_INVOKABLE void removeFromArray(QString id, int index);
    Q_INVOKABLE QString getFromArray(QString id, int index);
    Q_INVOKABLE int getIndexByDate(QString id, QString date);
    Q_INVOKABLE void sortDiary(QString id);
    Q_INVOKABLE QString loadLanguage();
    Q_INVOKABLE void setLanguage(QString language);
    Q_INVOKABLE void translateInputs();
    Q_INVOKABLE void resetInputs(QList<bool> params);

private:
    struct CustomInput
    {
        enum inputType {STRING, ARRAY};
        QString trId;
        QString settingsId;
        inputType type;
    };

    enum resetParameter {REASONS=0, DEPRESSION_NICE, SUICIDE_PLAN, DEPRESSION_PLAN, DEPRESSION_PRAISE, CUSTOM_THEME, DEPRESSION_MOOD, LANGUAGE, FOOD, MY_CONTACTS, DIARY, FOOD_RECORDS, SELF_HARM_HELPED, SELF_HARM_PLAN, SELF_HARM_TIMER, CONTACT_MESSAGE, RESET_PARAMS_COUNT};
    static const char* TO_TRANSLATE;
    static const std::vector<CustomInput> customInputs;
    void checkDefault(CustomInput input);
    void translateDefault(CustomInput input);
    QList<QString> parseList(QString input);
    QSettings settings;
};

#endif // USERDATAPROVIDER_H
