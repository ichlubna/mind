package org.dontpanic;

import android.app.AlarmManager;
import android.content.Context;
import java.util.Calendar;
import android.app.Activity;
import android.content.Intent;
import android.app.PendingIntent;
import android.os.Bundle;
import android.content.IntentFilter;
import android.content.BroadcastReceiver;
import org.qtproject.qt5.android.bindings.QtActivity;
//import android.provider.AlarmClock;

public class SetNotificationAlarm
{
    public SetNotificationAlarm() {}

    public static void setAlarm(Context context) {
        // Quote in Morning at 08:32:00 AM
            Calendar calendar = Calendar.getInstance();

            calendar.set(Calendar.HOUR_OF_DAY, 9);
            calendar.set(Calendar.MINUTE, 55);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);

            Calendar cur = Calendar.getInstance();

            if (cur.after(calendar)) {
                calendar.add(Calendar.DATE, 1);
            }

            Intent myIntent = new Intent(context, SetNotificationAlarm.class);
            int ALARM1_ID = 10000;
            PendingIntent pendingIntent = PendingIntent.getBroadcast(
                    context, ALARM1_ID, myIntent, PendingIntent.FLAG_UPDATE_CURRENT);
            AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            alarmManager.setRepeating(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), AlarmManager.INTERVAL_DAY, pendingIntent);
            }
}
