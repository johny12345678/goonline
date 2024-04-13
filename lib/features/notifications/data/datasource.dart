
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationDatasource{
  final FlutterLocalNotificationsPlugin notificationsPlugin = 
   FlutterLocalNotificationsPlugin();

   Future<void> notificationInit() async {
      AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('app_png');
   


final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    );
    await notificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {

    });

}

notificationDetails(){
  return const NotificationDetails(
    android: AndroidNotificationDetails('channelId', 'channelName', importance: Importance.max)
  );
}

Future showNotification (
  {
    int id = 0, String? title, String? body, String? payLoad
  }
)async {
  return notificationsPlugin.show(id, title, body, await notificationDetails());
}
}