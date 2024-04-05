// import 'dart:convert';
// import 'package:spacex/core/resources/app_colors.dart';
// import 'package:spacex/core/config/notification/on_message_helper.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// abstract class NotificationHelper {
//   static final flutterLocalNotifications = FlutterLocalNotificationsPlugin();
//
//   /// initialize local notifications
//   static Future<void> initLocal() async {
//     try {
//       const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('icon');
//       const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
//         requestSoundPermission: true,
//         requestBadgePermission: true,
//         requestAlertPermission: true,
//       );
//       const initializationSettings = InitializationSettings(android: androidSettings, iOS: iosSettings);
//       flutterLocalNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
//       await flutterLocalNotifications.initialize(
//         initializationSettings,
//         onDidReceiveNotificationResponse: _onClickLocalNotification,
//       );
//     } catch (_) {}
//   }
//
//   /// initialize fcm
//   static Future<void> initFirebaseMessaging() async {
//     try {
//       final status = await _requestPermission();
//       if (status == AuthorizationStatus.authorized) {
//         // todo:
//       }
//       final token = await FirebaseMessaging.instance.getToken();
//       debugPrint('fcm: $token');
//     } catch (_) {}
//   }
//
//   static Future<AuthorizationStatus> _requestPermission() async {
//     final settings = await FirebaseMessaging.instance.requestPermission(
//       sound: true,
//       badge: true,
//       alert: true,
//       criticalAlert: true,
//       announcement: true,
//       carPlay: false,
//       // provisional: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//     } else {}
//     return settings.authorizationStatus;
//   }
//
//   static void initRemoteOnMessages() {
//     FirebaseMessaging.onMessage.listen(_onMessage);
//
//     FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
//
//     FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
//   }
//
//   /// This method is invoked when a user clicks on a notification
//   /// while the app is already **open** and running in the foreground.
//   static void _onMessageOpenedApp(RemoteMessage message) {
//     debugPrint("onMessageOpenedApp: ${message.notification?.title} | ${message.data}");
//     OnMessageHelper.onMessageClicked(message.data);
//   }
//
//   /// Executed when app is opened
//   ///
//   /// Opens local notification with current payload
//   static void _onMessage(RemoteMessage message) {
//     debugPrint("onMessage: ${message.notification?.title} | ${message.data}");
//     OnMessageHelper.onMessageReceived(message.data);
//
//     // show message
//     final notification = message.notification;
//     if (notification?.title != null) {
//       NotificationHelper.showLocalNotification(
//         // navigatorKey.currentContext!.isArabic ? message.data['title_ar'] : message.data['title_en'],
//         // navigatorKey.currentContext!.isArabic ? message.data['description_ar'] : message.data['description_en'],
//         notification!.title!,
//         notification.body ?? '',
//         payload: jsonEncode(message.data),
//       );
//     }
//   }
//
//   static Future<void> _onClickLocalNotification(NotificationResponse response) async {
//     if (response.payload != null) {
//       final data = jsonDecode(response.payload!);
//       OnMessageHelper.onMessageClicked(data);
//     }
//   }
//
//   /// Executed when app is terminated or killed
//   @pragma('vm:entry-point')
//   static Future<dynamic> _onBackgroundMessage(RemoteMessage message) async {
//     debugPrint("onBackground: ${message.notification?.title} | ${message.data}");
//     OnMessageHelper.onMessageReceived(message.data);
//
//     // if (message.data['title_ar'] != null && message.data['description_ar'] != null) {
//     //   NotificationHelper.showLocalNotification(
//     //     navigatorKey.currentContext?.isArabic != false ? message.data['title_ar'] : message.data['title_en'],
//     //     navigatorKey.currentContext?.isArabic != false ? message.data['description_ar'] : message.data['description_en'],
//     //     payload: jsonEncode(message.data),
//     //   );
//     // }
//   }
//
//   /// Show local notification
//   static Future<void> showLocalNotification(
//     String title,
//     String body, {
//     String? payload,
//   }) async {
//     const androidDetails = AndroidNotificationDetails(
//       'main',
//       'amyal_main_channel',
//       playSound: true,
//       importance: Importance.max,
//       priority: Priority.max,
//       color: kMainColor,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);
//
//     return await flutterLocalNotifications.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }
// }
