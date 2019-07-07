#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QString>
#include <iostream>
#include <src/cpp/userdataprovider.h>
#include <src/cpp/mathengine.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<UserDataProvider>("io.qt.UserDataProvider", 1, 0, "UserDataProvider");
    qmlRegisterType<MathEngine>("io.qt.MathEngine", 1, 0, "MathEngine");

    QLocale::Language language = QLocale::system().language();
    QString langString = "EN";
    QSettings settings("DontPanicDevs", "DontPanic");
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

           default:
               langString = "EN";
               break;
       }
    }
    else
        langString = settings.value("language").toString();

    int returnValue = 0;
    do
    {
        QApplication app(argc, argv);
        QTranslator translator;
        translator.load(":/translation/"+langString+".qm");
        app.installTranslator(&translator);

        QQmlApplicationEngine engine;
        engine.load(QUrl(QStringLiteral("qrc:/src/qml/main.qml")));
        if (engine.rootObjects().isEmpty())
            return -1;

        returnValue = app.exec();

        langString = settings.value("language").toString();
    }
    while(returnValue == UserDataProvider::TRANSLATION_RESTART);


    return returnValue;
}
