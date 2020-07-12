package org.dontpanic;

import android.app.AlarmManager;
import android.content.Context;
import java.util.Calendar;
import android.app.Activity;
import android.content.Intent;
import android.app.PendingIntent;
import android.content.SharedPreferences;

public class SetNotificationAlarm
{
    public SetNotificationAlarm() {}
    private static int ALARM1_ID = 10000;
    private static String SP_STRING = "DontPanicSharedPreferences";

    public static void updateAlarm(Context context, String title, String message)
    {
        SharedPreferences sp = context.getSharedPreferences(SP_STRING, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sp.edit();
        editor.putString("title", title);
        editor.putString("message", message);
        editor.putBoolean("on", true);
        editor.commit();

        setAlarm(context);
    }

    public static void setAlarm(Context context) {
            Calendar calendar = Calendar.getInstance();

            calendar.set(Calendar.HOUR_OF_DAY, 17);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);

            Calendar cur = Calendar.getInstance();

            if (cur.after(calendar)) {
                calendar.add(Calendar.DATE, 1);
            }

            Intent myIntent = new Intent(context, NotificationReceiver.class);
            myIntent.putExtra("action", "notificationAlarm");
            myIntent.setFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);           
            PendingIntent pendingIntent = PendingIntent.getBroadcast(
                    context, ALARM1_ID, myIntent, PendingIntent.FLAG_UPDATE_CURRENT);
            AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            alarmManager.setRepeating(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), AlarmManager.INTERVAL_DAY, pendingIntent);
            }

    public static void cancelAlarm(Context context)
    {
        SharedPreferences sp = context.getSharedPreferences(SP_STRING, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sp.edit();
        editor.putBoolean("on", false);
        editor.commit();

        Intent myIntent = new Intent(context, NotificationReceiver.class);
        myIntent.setFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
        PendingIntent pendingIntent = PendingIntent.getBroadcast(
                context, ALARM1_ID, myIntent, PendingIntent.FLAG_UPDATE_CURRENT);
        AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        alarmManager.cancel(pendingIntent);
    }
}
