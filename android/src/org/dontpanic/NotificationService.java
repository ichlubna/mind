package org.dontpanic;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.app.PendingIntent;
import android.graphics.Color;
import android.graphics.BitmapFactory;
import android.app.NotificationChannel;
import android.content.BroadcastReceiver;
import android.media.RingtoneManager;
import android.content.IntentFilter;
import android.net.Uri;
import android.app.Service;
import android.os.IBinder;

public class NotificationService extends Service {
    private static NotificationManager m_notificationManager;
    private static Notification.Builder m_builder;
@Override
public int onStartCommand(Intent intent, int flags, int startId) {

   YourTask();

  return Service.START_STICKY;
}

private void YourTask(){
    Uri alarmSound = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
    System.err.println("Recieved!!!");
    try {
        Context context = this;
        m_notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            int importance = NotificationManager.IMPORTANCE_DEFAULT;
            NotificationChannel notificationChannel = new NotificationChannel("Qt", "Qt Notifier", importance);
            m_notificationManager.createNotificationChannel(notificationChannel);
            m_builder = new Notification.Builder(context, notificationChannel.getId());
        } else {
            m_builder = new Notification.Builder(context);
        }

        m_builder.setSmallIcon(R.drawable.icon)
                .setLargeIcon(BitmapFactory.decodeResource(context.getResources(), R.drawable.icon))
                .setContentTitle("A message from Qt!")
                .setContentText("message").setSound(alarmSound)
                .setDefaults(Notification.DEFAULT_SOUND)
                .setColor(Color.GREEN)
                .setAutoCancel(true);

        m_notificationManager.notify(0, m_builder.build());
    } catch (Exception e) {
        e.printStackTrace();
    }
}

@Override
public IBinder onBind(Intent intent) {
    // TODO: Return the communication channel to the service.
    throw new UnsupportedOperationException("Not yet implemented");
}


}

/*

public class NotificationReceiver extends Service{
private static NotificationManager m_notificationManager;
private static Notification.Builder m_builder;
private static BroadcastReceiver br;

@Override
 public IBinder onBind(Intent arg0)
 {
  return null;
 }

@Override
public void onCreate()
{
 registerReceiver();
}

@Override
public void onDestroy()
{
 unregisterReceiver(br);
}

private void registerReceiver()
{
    br = new BroadcastReceiver()
    {
    @Override
    public void onReceive(Context context, Intent intent) {
        Uri alarmSound = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
        System.err.println("Recieved!!!");
        try {
            m_notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);

            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                int importance = NotificationManager.IMPORTANCE_DEFAULT;
                NotificationChannel notificationChannel = new NotificationChannel("Qt", "Qt Notifier", importance);
                m_notificationManager.createNotificationChannel(notificationChannel);
                m_builder = new Notification.Builder(context, notificationChannel.getId());
            } else {
                m_builder = new Notification.Builder(context);
            }

            m_builder.setSmallIcon(R.drawable.icon)
                    .setLargeIcon(BitmapFactory.decodeResource(context.getResources(), R.drawable.icon))
                    .setContentTitle("A message from Qt!")
                    .setContentText("message").setSound(alarmSound)
                    .setDefaults(Notification.DEFAULT_SOUND)
                    .setColor(Color.GREEN)
                    .setAutoCancel(true);

            m_notificationManager.notify(0, m_builder.build());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }};
    IntentFilter intentFilter = new IntentFilter("DONTPANIC_NOTIFICATION");
    intentFilter.addCategory(Intent.CATEGORY_DEFAULT);
    registerReceiver(br, intentFilter);
    System.err.println("Registered!!!");
    }
}
*/
