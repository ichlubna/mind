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
import android.content.SharedPreferences;

public class NotificationService extends Service {
    private static String SP_STRING = "DontPanicSharedPreferences";

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
       SharedPreferences sp = this.getSharedPreferences(SP_STRING, Context.MODE_PRIVATE);
       String title = sp.getString("title", null);
       String message = sp.getString("message", null);
       ShowNotification(title, message);
      return Service.START_STICKY;
    }

    private void ShowNotification(String title, String message){
        try {
            Context context = this;
            NotificationManager m_notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            Notification.Builder m_builder;

            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                int importance = NotificationManager.IMPORTANCE_DEFAULT;
                NotificationChannel notificationChannel = new NotificationChannel("Qt", "Qt Notifier", importance);
                m_notificationManager.createNotificationChannel(notificationChannel);
                m_builder = new Notification.Builder(context, notificationChannel.getId());
            } else {
                m_builder = new Notification.Builder(context);
            }

            m_builder.setSmallIcon(R.drawable.smallicon)
                    .setLargeIcon(BitmapFactory.decodeResource(context.getResources(), R.drawable.icon))
                    .setContentTitle(title)
                    .setContentText(message)
                    .setDefaults(Notification.DEFAULT_SOUND)
                    //.setColor(Color.GREEN)
                    .setAutoCancel(true)
                    .setContentIntent(PendingIntent.getActivity(
                            context,
                            0,
                            getPackageManager().getLaunchIntentForPackage("org.dontpanic"),
                            PendingIntent.FLAG_UPDATE_CURRENT));


            m_notificationManager.notify(0, m_builder.build());
        } catch (Exception e) {
            e.printStackTrace();
        }
}

@Override
public IBinder onBind(Intent intent) {
    throw new UnsupportedOperationException("Not yet implemented");
}


}

