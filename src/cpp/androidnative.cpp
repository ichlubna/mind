#include <QtAndroidExtras/QtAndroid>
#include <QVector>
#include <QAndroidJniEnvironment>
#include "androidnative.h"


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

void AndroidNative::requestReadWrite()
{
    requestAndroidPermissions();
}

void AndroidNative::updateNotifications(std::string title, std::string message)
{
    QAndroidJniObject titleString = QAndroidJniObject::fromString(title.c_str());
    QAndroidJniObject messageString = QAndroidJniObject::fromString(message.c_str());
    QAndroidJniObject::callStaticMethod<void>(
        "org/dontpanic/SetNotificationAlarm",
        "updateAlarm",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V",
        QtAndroid::androidContext().object(),titleString.object<jstring>(), messageString.object<jstring>());
}

void AndroidNative::cancelNotifications()
{
    QAndroidJniObject::callStaticMethod<void>(
        "org/dontpanic/SetNotificationAlarm",
        "cancelAlarm",
        "(Landroid/content/Context;)V",
        QtAndroid::androidContext().object());
}


