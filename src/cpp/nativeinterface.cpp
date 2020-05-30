#include "nativeinterface.h"
#if defined (Q_OS_ANDROID)
    #include "androidnative.h"
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

void NativeInterface::updateNotifications()
{
#if defined (Q_OS_ANDROID)
    AndroidNative::updateNotifications();
#endif
}
