#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QString>
#include <iostream>
#include <src/cpp/userdataprovider.h>
#include <src/cpp/mathengine.h>
#include <QProcess>

int main(int argc, char *argv[])
{
    int returnValue = 0;
    do
    {
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

        qmlRegisterType<UserDataProvider>("io.qt.UserDataProvider", 1, 0, "UserDataProvider");
        qmlRegisterType<MathEngine>("io.qt.MathEngine", 1, 0, "MathEngine");
        QApplication app(argc, argv);
        QTranslator translator;

        QLocale::Language language = QLocale::system().language();
        QString langString = "EN";
        QSettings settings("DontPanicDevs", "DontPanic");
        UserDataProvider dataProvider;

        if (!settings.contains("language"))
        {
           switch(language)
           {
               case QLocale::Language::Czech:
                langString = "CZ";
               break;

               case QLocale::Language::Slovak:
                langString = "SK";
               break;

               case QLocale::Language::English:
                langString = "EN";
               break;

               case QLocale::Language::Polish:
                langString = "PL";
               break;

               case QLocale::Language::French:
                langString = "FR";
               break;

               case QLocale::Language::Spanish:
                langString = "ES";
               break;

               case QLocale::Language::Italian:
                langString = "IT";
               break;

               default:
                   langString = "EN";
               break;
           }
           settings.setValue("language", langString);
        }
        else
            langString = settings.value("language").toString();

        translator.load(":/translation/"+langString+".qm");
        app.installTranslator(&translator);

        dataProvider.initCheck();

        QQmlApplicationEngine engine;
        engine.load(QUrl(QStringLiteral("qrc:/src/qml/main.qml")));
        if (engine.rootObjects().isEmpty())
            return -1;

        returnValue = app.exec();

        langString = settings.value("language").toString();
        app.quit();
    }
    while(returnValue == UserDataProvider::TRANSLATION_RESTART);

    return returnValue;
}
