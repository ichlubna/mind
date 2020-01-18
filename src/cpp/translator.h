#ifndef TRANSLATOR_H
#define TRANSLATOR_H
#include <QObject>
#include <QSet>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>

class Translator
{
public:
    explicit Translator();
    ~Translator();
    QQmlApplicationEngine *engine;
    QApplication *app;
    static QList<QString> languages;
    QMap<QString, QTranslator*> translators;
    QString currentLanguage = "EN";
private:

};

class TranslatorAdapter: public QObject
{
    Q_OBJECT
public:
    explicit TranslatorAdapter(QObject *parent = nullptr);
    ~TranslatorAdapter();
    void static connectToApp(QApplication *app ,QQmlApplicationEngine *engine, QString language);
    Q_INVOKABLE static QList<QString> getLanguages() {return instance->languages;}
    Q_INVOKABLE static QList<QString> getLanguagesExcept(QList<QString> excluded) {return (instance->languages.toSet().subtract(excluded.toSet())).toList();}
    Q_INVOKABLE static void changeLanguage(QString language);
    Q_INVOKABLE static Translator *getInstance();
private:
    static Translator* instance;
};

#endif // TRANSLATOR_H
