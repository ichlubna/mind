#ifndef NATIVEINTERFACE_H
#define NATIVEINTERFACE_H
#include <QObject>
#include <string>

class NativeInterface : public QObject
{
    Q_OBJECT
public:
    NativeInterface(QObject *parent = nullptr);
    Q_INVOKABLE static void requestReadWrite();
    Q_INVOKABLE static void updateNotifications(std::string title, std::string message);
};

#endif // NATIVEINTERFACE_H
