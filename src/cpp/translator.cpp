#include "translator.h"

#include <iostream>

QList<QString> Translator::languages{"CS", "SK", "PL", "FR", "EN", "IT", "ES", "RU", "DE", "UK"};
QList<QLocale::Language> Translator::languagesLocale{QLocale::Language::Czech, QLocale::Language::Slovak, QLocale::Language::Polish, QLocale::Language::French, QLocale::Language::English,
                                                     QLocale::Language::Italian, QLocale::Language::Spanish, QLocale::Language::Russian, QLocale::Language::German, QLocale::Language::Ukrainian};


Translator *TranslatorAdapter::instance = nullptr;

Translator::Translator()
{
    for(auto const &language : languages)
    {
        generalTranslators.emplace(language, std::make_unique<QTranslator>());
        generalTranslators[language]->load(":/translation/"+language+".qm");
        extraTranslators.emplace(language, std::make_unique<QTranslator>());
        extraTranslators[language]->load(":/translation/extra/"+language+".qm");
    }
}

void TranslatorAdapter::installTranslators(QString language, Translator *i)
{
    i->app->installTranslator(i->generalTranslators[language].get());
    i->app->installTranslator(i->extraTranslators[language].get());
}

void TranslatorAdapter::removeTranslators(Translator *i)
{
    i->app->removeTranslator(i->generalTranslators[i->currentLanguage].get());
    i->app->removeTranslator(i->extraTranslators[i->currentLanguage].get());
}

void TranslatorAdapter::connectToApp(QApplication *a ,QQmlApplicationEngine *e, QString language)
{
    Translator *i = getInstance();
    i->engine = e;
    i->app = a;
    i->currentLanguage = language;
    installTranslators(language, i);
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
    removeTranslators(i);
    installTranslators(language, i);
    i->currentLanguage = language;
    i->engine->retranslate();
}

Translator::~Translator()
{
}

TranslatorAdapter::TranslatorAdapter(QObject *parent) : QObject(parent)
{
     if(instance == nullptr)
         delete instance;
}

TranslatorAdapter::~TranslatorAdapter()
{}
