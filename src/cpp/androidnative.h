#ifndef ANDROIDNATIVE_H
#define ANDROIDNATIVE_H
#include <string>


class AndroidNative
{
public:
    static void requestReadWrite();
    static void updateNotifications(std::string title, std::string message);
    static void cancelNotifications();
};
#endif // ANDROIDNATIVE_H
