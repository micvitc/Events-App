import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings(
      // 'assets/notif_icon.png'
      '@drawable/ic_flutternotification'
    );

    // final IOSInitializationSettings IOSInitializationSettings = IOSInitializationSettings(
    //   requestAlertPermission: false,
    //   requestBadgePermission: false,
    //   requestSoundPermission: false,
    //   );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      // iOS: IOSInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id, String title, String body, int seconds) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id, title, body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "main_channel",
          "Main_channel",
          // "Main Channel Notification",
          importance: Importance.max,
          priority: Priority.max,
          // icon: 'assets/notif_icon.png',
          icon: '@drawable/ic_flutternotification',
        ),
          // iOS: IOSNotficationDetais(
          //   sound: 'default.wav',
          //   presentAlert: true,
          //   presentBadge: true,
          //   presentSound: true,
          // ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true
    );
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

}

/*
In main.dart, insde main()

WidgetFlutterBinding.ensureInitialized();
await NotificationService().initNotification();

Create a new screen, say HomeScreen

import timezone and timezone latest as tz

In initState func,
tz.initializeTimeZones();

Center(
  child: GestureDetector(
    onTap: () {
      NotificationService().showNotification(1, "Title", "Body", 5);
    },
    child: Text("Show Notification"),
  ),
)
*/ 