#ifndef ANDROIDNATIVE_H
#define ANDROIDNATIVE_H
#include <QtAndroidExtras/QtAndroid>

class AndroidNative
{
public:
    static void requestReadWrite();
    static void updateNotifications();
};
#endif // ANDROIDNATIVE_H
