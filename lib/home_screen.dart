import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  // final NotificationAppLaunchDetails? notificationAppLaunchDetails;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const HomeScreen(
    //this.notificationAppLaunchDetails,
    this.flutterLocalNotificationsPlugin, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Schedule a notification every minute
              _scheduleNotification();
            },
            child: const Text('Schedule Notification Every Minute'),
          ),
        ],
      ),
    );
  }

  Future<void> _scheduleNotification() async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    // Schedule a notification every minute
    tz.TZDateTime scheduledDate = tz.TZDateTime.now(tz.local);
    for (var i = 0; i < 10; i++) {
      scheduledDate = scheduledDate.add(const Duration(minutes: 1));

      await flutterLocalNotificationsPlugin.zonedSchedule(
        i,
        'Notification Title',
        'Notification Body',
        scheduledDate,
        platformChannelSpecifics,
        //androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'notification_payload',
      );
    }
  }
}
