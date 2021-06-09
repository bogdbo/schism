package com.example.test_flutter

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.annotation.RequiresApi


class ServiceScheduler : BroadcastReceiver() {

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onReceive(context: Context?, intent: Intent?) {
        val startServiceIntent = Intent(context, MainService::class.java)
        context!!.startService(startServiceIntent)
        schedule(context)
    }

    @RequiresApi(Build.VERSION_CODES.M)
    fun schedule(context: Context?) {
        val alarm = context!!.getSystemService(AlarmManager::class.java)
        val intent = Intent(context, ServiceScheduler::class.java)
        val pendingIntent = PendingIntent.getBroadcast(context, 0, intent, 0)
        alarm.setExactAndAllowWhileIdle(
            AlarmManager.RTC_WAKEUP,
            (System.currentTimeMillis() / 1000L + 5L) * 1000L,
            pendingIntent
        )

    }
}