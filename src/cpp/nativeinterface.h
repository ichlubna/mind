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
    Q_INVOKABLE static void updateNotifications(QString title, QString message, bool enable);
    Q_INVOKABLE static void setScreenLock(bool allow);
};

#endif // NATIVEINTERFACE_H
