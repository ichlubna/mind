#include "permissionsos.h"
#include <QSysInfo>

#if defined (Q_OS_ANDROID)
#include <QtAndroidExtras/QtAndroid>
bool requestAndroidPermissions(){
    const QVector<QString> permissions({"android.permission.WRITE_EXTERNAL_STORAGE",
                                        "android.permission.READ_EXTERNAL_STORAGE"});

    for(const QString &permission : permissions){
        auto result = QtAndroid::checkPermission(permission);
        if(result == QtAndroid::PermissionResult::Denied){
            auto resultHash = QtAndroid::requestPermissionsSync(QStringList({permission}));
            if(resultHash[permission] == QtAndroid::PermissionResult::Denied)
                return false;
        }
    }
    return true;
}
#endif

PermissionsOS::PermissionsOS(QObject *parent) : QObject(parent)
{}

PermissionsOS::~PermissionsOS()
{}

void PermissionsOS::requestReadWrite()
{
#if defined (Q_OS_ANDROID)
    requestAndroidPermissions();
#endif
}

QString PermissionsOS::getSystemInfo()
{
    return QSysInfo::productType() + "|" + QSysInfo::productVersion();
}
