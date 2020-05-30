#ifndef NATIVEINTERFACE_H
#define NATIVEINTERFACE_H
#include <QObject>

class NativeInterface : public QObject
{
    Q_OBJECT
public:
    NativeInterface(QObject *parent = nullptr);
    Q_INVOKABLE static void requestReadWrite();
    Q_INVOKABLE static void updateNotifications();
};

#endif // NATIVEINTERFACE_H
