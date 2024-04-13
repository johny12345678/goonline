
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationDatasource{
  static final FlutterLocalNotificationsPlugin notificationsPlugin = 
   FlutterLocalNotificationsPlugin();


  static notificationInit() async {
      await notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
      notificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()
          ));
          
   
  
   }

   static pushNotification ({required String title, required String body}) async {

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