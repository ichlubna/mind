#include <QString>
#include <QTranslator>
#include <iostream>
#include <src/cpp/translator.h>
#include <src/cpp/userdataprovider.h>
#include <src/cpp/mathengine.h>
#include <src/cpp/importerExporter.h>
#include <src/cpp/nativeinterface.h>
#include <QProcess>

int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("DontPanicDevs");

    qmlRegisterType<UserDataProvider>("io.qt.UserDataProvider", 1, 0, "UserDataProvider");
    qmlRegisterType<TranslatorAdapter>("io.qt.Translator", 1, 0, "Translator");
    qmlRegisterType<MathEngine>("io.qt.MathEngine", 1, 0, "MathEngine");
    qmlRegisterType<ImporterExporter>("io.qt.ImporterExporter", 1, 0, "ImporterExporter");
    qmlRegisterType<NativeInterface>("io.qt.NativeInterface", 1, 0, "NativeInterface");

    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QSettings settings("DontPanicDevs", "DontPanic");
    UserDataProvider dataProvider;

    TranslatorAdapter::connectToApp(&app, &engine, dataProvider.loadLanguage());
    dataProvider.initCheck();

    auto ni = std::make_unique<NativeInterface>();
    ni->updateNotifications(qtTrId("notification-title"), qtTrId("notification-msg"), dataProvider.loadBoolInput("notificationsOn"));

    engine.load(QUrl(QStringLiteral("qrc:/src/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
