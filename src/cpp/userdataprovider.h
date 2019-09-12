#ifndef USERDATAPROVIDER_H
#define USERDATAPROVIDER_H

#include <QObject>
#include <QString>
#include <QSettings>

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
    Q_INVOKABLE QString loadLanguage();
    Q_INVOKABLE void setLanguage(QString language);
    Q_INVOKABLE void resetInputs(bool reasons, bool nice, bool plan, bool depressionPlan, bool theme, bool moods, bool language, bool foodTasks);

    static constexpr int TRANSLATION_RESTART = 42;

private:
    struct CustomInput
    {
        enum inputType {STRING, ARRAY};
        QString trId;
        QString settingsId;
        inputType type;
    };
    static const char* TO_TRANSLATE;
    static const std::vector<CustomInput> customInputs;
    void checkDefault(CustomInput input);
    void translateDefault(CustomInput input);
    QSettings settings;
};

#endif // USERDATAPROVIDER_H