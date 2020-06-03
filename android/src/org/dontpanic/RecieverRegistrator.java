package org.dontpanic;

import android.app.Activity;
import android.content.Context;
import android.content.BroadcastReceiver;
import org.qtproject.qt5.android.bindings.QtActivity;
import android.content.IntentFilter;


public class RecieverRegistrator extends QtActivity {
    public void registerReceiver()
    {
        NotificationReceiver nr = new NotificationReceiver();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("intent_myaction_alarm");
        registerReceiver(nr, intentFilter);
     }
}
