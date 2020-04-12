#ifndef PERMISSIONSOS_H
#define PERMISSIONSOS_H
#include <QObject>
#include <QUrl>

class PermissionsOS : public QObject
{
    Q_OBJECT
public:
    explicit PermissionsOS(QObject *parent = nullptr);
    ~PermissionsOS();
    Q_INVOKABLE static void requestReadWrite();
    Q_INVOKABLE static QString getSystemInfo();
};

#endif // PERMISSIONSOS_H
