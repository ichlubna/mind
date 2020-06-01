#if defined (Q_OS_ANDROID)
#include <QtAndroidExtras/QtAndroid>
#include <QVector>
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

void AndroidNative::updateNotifications()
{
    QAndroidJniObject javaNotification = QAndroidJniObject::fromString("m_notification");
    QAndroidJniObject::callStaticMethod<void>(
        "org/dontpanic/AndroidNotification",
        "notify",
        "(Landroid/content/Context;Ljava/lang/String;)V",
        QtAndroid::androidContext().object(),
        javaNotification.object<jstring>());
}

/*static const char *g_TAG = 0;
__android_log_write(ANDROID_LOG_WARN, g_TAG, file.errorString().toStdString().data());
__android_log_write(ANDROID_LOG_WARN, g_TAG, QString::number(file.error()).toStdString().data());
__android_log_write(ANDROID_LOG_WARN, g_TAG, fileName.toLocalFile().toStdString().data());*/
#endif
