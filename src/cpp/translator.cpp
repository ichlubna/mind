#include "translator.h"
QList<QString> Translator::languages{"CZ", "SK", "PL", "FR", "EN", "IT", "ES", "RU", "DE"};
QList<QLocale::Language> Translator::languagesLocale{QLocale::Language::Czech, QLocale::Language::Slovak, QLocale::Language::Polish, QLocale::Language::French, QLocale::Language::English,
                                                     QLocale::Language::Italian, QLocale::Language::Spanish, QLocale::Language::Russian, QLocale::Language::German};


Translator *TranslatorAdapter::instance = nullptr;

Translator::Translator()
{
    for(auto const &language : languages)
    {
        translators.insert(language, new QTranslator());
        translators[language]->load(":/translation/"+language+".qm");
    }
}

void TranslatorAdapter::connectToApp(QApplication *a ,QQmlApplicationEngine *e, QString l)
{
    Translator *i = getInstance();
    i->engine = e;
    i->app = a;
    i->currentLanguage = l;
    i->app->installTranslator(i->translators[l]);
    i->engine->retranslate();
}

Translator *TranslatorAdapter::getInstance()
{
    if(instance == nullptr)
        instance = new Translator();
    return instance;
}

void TranslatorAdapter::changeLanguage(QString language)
{
    Translator *i = getInstance();
    i->app->removeTranslator(i->translators[i->currentLanguage]);
    i->app->installTranslator(i->translators[language]);
    i->currentLanguage = language;
    i->engine->retranslate();
}

Translator::~Translator()
{
    for(auto &t : translators)
        delete t;
}

TranslatorAdapter::TranslatorAdapter(QObject *parent) : QObject(parent)
{}

TranslatorAdapter::~TranslatorAdapter()
{}
