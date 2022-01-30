//#include <QtAndroidExtras/QtAndroid>
#include <QtCore/private/qandroidextras_p.h>
#include <QVector>
#include <QJniObject>
#include <QJniEnvironment>

#include "androidnative.h"


bool requestAndroidPermissions(){
    const QVector<QString> permissions({"android.permission.WRITE_EXTERNAL_STORAGE",
                                        "android.permission.READ_EXTERNAL_STORAGE"});

    for(const QString &permission : permissions){
        auto result = QtAndroidPrivate::checkPermission(permission);
        if(result.takeResult() == QtAndroidPrivate::PermissionResult::Denied){
            auto resultHash = QtAndroidPrivate::requestPermission(permission);
            if(resultHash.takeResult() == QtAndroidPrivate::PermissionResult::Denied)
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
    QJniObject titleString = QJniObject::fromString(title.c_str());
    QJniObject messageString = QJniObject::fromString(message.c_str());
    QJniObject::callStaticMethod<void>(
        "org/dontpanic/SetNotificationAlarm",
        "updateAlarm",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V");
        //QtAndroidPrivate::androidContext().object(),titleString.object<jstring>(), messageString.object<jstring>());
}

void AndroidNative::cancelNotifications()
{
    QJniObject::callStaticMethod<void>(
        "org/dontpanic/SetNotificationAlarm",
        "cancelAlarm",
        "(Landroid/content/Context;)V");
        //QtAndroidPrivate::androidContext().object());
}


