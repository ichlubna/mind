#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <iostream>
#include <src/cpp/userdataprovider.h>
#include <src/cpp/mathengine.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QTranslator translator;
    translator.load(":/translation/CZ.qm");
    app.installTranslator(&translator);

    qmlRegisterType<UserDataProvider>("io.qt.UserDataProvider", 1, 0, "UserDataProvider");
    qmlRegisterType<MathEngine>("io.qt.MathEngine", 1, 0, "MathEngine");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/src/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
