#ifndef IOSNATIVE_H
#define IOSNATIVE_H
#include <string>


class IosNative
{
public:
    static void updateNotifications(std::string title, std::string message);
    static void cancelNotifications();
};
#endif // IOSNATIVE_H
