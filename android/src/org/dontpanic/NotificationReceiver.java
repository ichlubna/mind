package org.dontpanic;

import android.content.Context;
import android.content.Intent;
import android.content.BroadcastReceiver;
import android.os.Build;


public class NotificationReceiver extends BroadcastReceiver {
Context context;

public NotificationReceiver() {
}

@Override
public void onReceive(Context context, Intent intent) {
    intent = new Intent(context, NotificationService.class);
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
        context.startForegroundService(intent);
    } else {
        context.startService(intent);
    }
}

}

