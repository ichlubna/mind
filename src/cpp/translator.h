#ifndef TRANSLATOR_H
#define TRANSLATOR_H
#include <memory>
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
    static QList<QLocale::Language> languagesLocale;
    std::map<QString, std::unique_ptr<QTranslator>> generalTranslators;
    std::map<QString, std::unique_ptr<QTranslator>> extraTranslators;
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
    Q_INVOKABLE static QList<QLocale::Language> getLanguagesLocale() {return instance->languagesLocale;}
    Q_INVOKABLE static QList<QString> getLanguagesExcept(QList<QString> excluded) {return (QSet<QString>(instance->languages.begin(), instance->languages.end()).subtract(QSet<QString>(excluded.begin(), excluded.end()))).values();}
    Q_INVOKABLE static void changeLanguage(QString language);
    Q_INVOKABLE static Translator *getInstance();
private:
    static void installTranslators(QString l, Translator *i);
    static void removeTranslators(Translator *i);
    static Translator* instance;
};

#endif // TRANSLATOR_H
