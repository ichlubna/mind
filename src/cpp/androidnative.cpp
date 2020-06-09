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

void AndroidNative::updateNotifications()
{
    QAndroidJniObject setNotificationAlarm = QAndroidJniObject::fromString("SetNotificationAlarm");
    QAndroidJniObject::callStaticMethod<void>(
        "org/dontpanic/SetNotificationAlarm",
        "setAlarm",
        "(Landroid/content/Context;)V",
        QtAndroid::androidContext().object(),
        setNotificationAlarm.object<jstring>());

    QAndroidJniEnvironment env;
    jclass javaClass = env.findClass("org/dontpanic/NotificationReceiver");
    QAndroidJniObject classObject(javaClass);
    classObject.callMethod<void>("registerReceiver",
                                 "(Landroid/content/Context;)V",
                                 QtAndroid::androidContext().object());


   //QtAndroid::androidActivity().callMethod<void>("registerReceiver");
   /*QtAndroid::runOnAndroidThread([]{
          QAndroidJniObject myJavaObject("org/dontpanic/RegisterReceiver");
          myJavaObject.callMethod<void>("registerReceiver","()V");});*/
}

/*static const char *g_TAG = 0;
__android_log_write(ANDROID_LOG_WARN, g_TAG, file.errorString().toStdString().data());
__android_log_write(ANDROID_LOG_WARN, g_TAG, QString::number(file.error()).toStdString().data());
__android_log_write(ANDROID_LOG_WARN, g_TAG, fileName.toLocalFile().toStdString().data());*/

