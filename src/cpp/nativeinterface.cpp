#include "nativeinterface.h"
#include <QTranslator>
#if defined (Q_OS_ANDROID)
    #include "androidnative.h"
#endif
#if defined (Q_OS_IOS)
    #include "iosnative.h"
#endif

NativeInterface::NativeInterface(QObject *parent) : QObject(parent)
{
}

void NativeInterface::requestReadWrite()
{
#if defined (Q_OS_ANDROID)
    AndroidNative::requestReadWrite();
#endif  
}

//TODO call whenever language changes
void NativeInterface::updateNotifications(QString title, QString message, bool enable)
{
#if defined (Q_OS_ANDROID)
    if (enable)
        AndroidNative::updateNotifications(title.toStdString(), message.toStdString());
    else
        AndroidNative::cancelNotifications();
#endif
#if defined (Q_OS_IOS)
    if (enable)
        IosNative::updateNotifications(title.toStdString(), message.toStdString());
    else
        IosNative::cancelNotifications();
#endif
}
