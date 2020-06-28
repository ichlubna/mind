#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#include <QVariant>
#include "iosnative.h"

void IosNative::updateNotifications(std::string title, std::string message)
{
       UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
       [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error)
       {
           Q_UNUSED(granted);
           if (!error)
           {
               [[UIApplication sharedApplication] registerForRemoteNotifications];
           }
       }];

      UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
      content.title = QString::fromStdString(title).toNSString();
      content.body =  QString::fromStdString(message).toNSString();
      content.sound = [UNNotificationSound defaultSound];
      content.badge = @([[UIApplication sharedApplication] applicationIconBadgeNumber] + 1);

      NSDateComponents* date = [[NSDateComponents alloc] init];
      date.hour = 17;
      date.minute = 0;
      UNCalendarNotificationTrigger* trigger = [UNCalendarNotificationTrigger
             triggerWithDateMatchingComponents:date repeats:YES];

       NSString* identifierNSString = identifier.toNSString();
      // Create the request object.
      UNNotificationRequest* request = [UNNotificationRequest
             requestWithIdentifier:identifierNSString content:content trigger:trigger];

      UNUserNotificationCenter *ccenter = [UNUserNotificationCenter currentNotificationCenter];

      [ccenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
          if (error) {
              NSLog(@"Local Notification failed");}
      }];
      /*
      UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];

      NSString* identifierNSString = identifier.toNSString();

      UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifierNSString
              content:content trigger:trigger];

      UNUserNotificationCenter *ccenter = [UNUserNotificationCenter currentNotificationCenter];

      [ccenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
          if (error) {
              NSLog(@"Local Notification failed");
          }
      }];*/
}

void IosNative::cancelNotifications()
{
    NSString* identifierNSString = identifier.toNSString();
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    NSArray *array = [NSArray arrayWithObjects:identifierNSString, nil];
    [center removePendingNotificationRequestsWithIdentifiers:array];

}


