#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <QVariant>
#include "iosnative.h"

void IosNative::updateNotifications(std::string title, std::string message)
{
      QString identifier = "dontpanicidentifier";

      // create content
      UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
      content.title = QString::fromStdString(title).toNSString();
      content.body =  QString::fromStdString(message).toNSString();
      content.sound = [UNNotificationSound defaultSound];
      content.badge = @([[UIApplication sharedApplication] applicationIconBadgeNumber] + 1);

      // create trigger time
      UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];

      // unique identifier
      NSString* identifierNSString = identifier.toNSString();

      // create notification request
      UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifierNSString
              content:content trigger:trigger];

      // add request
      UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
      center.delegate = id(m_Delegate);

      [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
          if (error) {
              NSLog(@"Local Notification failed");
          }
      }];
}

void IosNative::cancelNotifications()
{

}


