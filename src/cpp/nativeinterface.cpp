#include "nativeinterface.h"
#include <QTranslator>
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

//TODO call whenever language changes
void NativeInterface::updateNotifications(std::string title, std::string message)
{
#if defined (Q_OS_ANDROID)
    AndroidNative::updateNotifications(title, message);
#endif
}
