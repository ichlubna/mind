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

        QSettings settings("DontPanicDevs", "DontPanic");
        UserDataProvider dataProvider;

        if (!settings.contains("language"))
            dataProvider.resetInputs(false,false,false,false,false,false,true,false,false,false,false);
        QString langString = settings.value("language").toString();

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
