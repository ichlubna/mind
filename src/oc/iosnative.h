#ifndef IOSNATIVE_H
#define IOSNATIVE_H
#include <QString>


class IosNative
{
public:
    static void updateNotifications(std::string title, std::string message);
    static void cancelNotifications();
private:
     QString identifier = "dontpanicidentifier";
};
#endif // IOSNATIVE_H
