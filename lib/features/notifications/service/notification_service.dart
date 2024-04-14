
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  final FlutterLocalNotificationsPlugin notificationsPlugin = 
   FlutterLocalNotificationsPlugin();

  Future <void> notificationInit() async {
      await notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
      notificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()
          ));
          
   
  
   }

   Future<void> pushNotification ({required String title, required String body}) async {

    var androidDetails = const AndroidNotificationDetails(
      'example_channel', 
      'my channel',
      importance: Importance.max,
      priority: Priority.high
      );

    var iosDetails = const DarwinNotificationDetails();

    var notificatinDetailes = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await notificationsPlugin.show(1, title, body, notificatinDetailes);
   }
  
   }