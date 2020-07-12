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
          SharedPreferences sp = context.getSharedPreferences(SP_STRING, Context.MODE_PRIVATE);
          if(sp.getBoolean("on", false))
             SetNotificationAlarm.setAlarm(context);
        }
}
