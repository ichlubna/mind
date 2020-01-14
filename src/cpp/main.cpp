#include <QString>
#include <iostream>
#include <src/cpp/translator.h>
#include <src/cpp/userdataprovider.h>
#include <src/cpp/mathengine.h>
#include <QProcess>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<UserDataProvider>("io.qt.UserDataProvider", 1, 0, "UserDataProvider");
    qmlRegisterType<TranslatorAdapter>("io.qt.Translator", 1, 0, "Translator");
    qmlRegisterType<MathEngine>("io.qt.MathEngine", 1, 0, "MathEngine");

    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QSettings settings("DontPanicDevs", "DontPanic");
    UserDataProvider dataProvider;

    TranslatorAdapter::connectToApp(&app, &engine, dataProvider.loadLanguage());
    dataProvider.initCheck();

    engine.load(QUrl(QStringLiteral("qrc:/src/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
