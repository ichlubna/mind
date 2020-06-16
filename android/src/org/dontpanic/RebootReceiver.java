package org.dontpanic;

import android.content.Context;
import android.content.Intent;
import android.content.BroadcastReceiver;
import android.content.SharedPreferences;
import android.os.Build;

import android.util.Log;

public class RebootReceiver extends BroadcastReceiver {

    private static String SP_STRING = "DontPanicSharedPreferences";

    @Override
    public void onReceive(Context context, Intent intent) {
          /*Log.d("aaa","what you want to log");
          Intent serviceIntent = new Intent(context, NotificationService.class);
          if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
              context.startForegroundService(serviceIntent);
          } else {
              context.startService(serviceIntent);
          }*/

          SharedPreferences sp = context.getSharedPreferences(SP_STRING, Context.MODE_PRIVATE);
          if(sp.getBoolean("on", false))
          SetNotificationAlarm.setAlarm(context);

        }

}
