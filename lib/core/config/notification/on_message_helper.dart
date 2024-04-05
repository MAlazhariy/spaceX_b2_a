// import 'package:spacex/core/config/notification/on_message_actions/employee_states.dart';
// import 'package:spacex/core/config/notification/on_message_actions/supervisor_states.dart';
// import 'package:spacex/core/config/notification/on_message_actions/user_states.dart';
// import 'package:spacex/core/utils/enums/notification_type.dart';
// import 'package:flutter/foundation.dart';
//
// abstract class OnMessageHelper {
//   /// Should called when the user tapped on one of these messages:
//   /// - local notification
//   /// - initial message (home screen)
//   /// - onMessageOpenedApp
//   ///
//   /// #### This function is responsible for getting data when user taps on a notification.
//   static void onMessageClicked(Map<String, dynamic>? data, {bool clicked = true}) async {
//     try {
//       if (data?.isNotEmpty == true) {
//         final type = getNotificationType(data!['type']);
//
//         switch (type) {
//           case NotificationType.userOrderStatusAccepted:
//             onOrderStatusAccepted(data, clicked: clicked);
//           case NotificationType.userOrderStatusFinished:
//             onOrderStatusAccepted(data, clicked: clicked);
//           case NotificationType.giftReceived:
//           // Do nothing!
//           case NotificationType.employeeLocationChanged:
//             onEmployeeLocationChanged(data, clicked: clicked);
//           case NotificationType.employeeTargetChanged:
//             onEmployeeTargetChanged(data, clicked: clicked);
//           case NotificationType.employeeNewOrder:
//             onEmployeeNewOrder(data, clicked: clicked);
//           case NotificationType.supervisorLocationChanged:
//             onSupervisorLocationChanged(data, clicked: clicked);
//           case NotificationType.supervisorNewEmployeeAssigned:
//             onSupervisorEmployeesUpdated(data, clicked: clicked);
//           case NotificationType.supervisorEmployeeRemoved:
//             onSupervisorEmployeesUpdated(data, clicked: clicked);
//           case NotificationType.supervisorEmployeeFinishedTarget:
//             onSupervisorEmployeeFinishedTarget(data, clicked: clicked);
//           case NotificationType.supervisorEmployeeActiveHour:
//             onSupervisorEmployeeActiveHours(data, clicked: clicked);
//           case NotificationType.supervisorNewOrder:
//             onSupervisorNewOrder(data, clicked: clicked);
//           case NotificationType.unknown:
//           // Do nothing!
//         }
//       }
//     } catch (_) {}
//   }
//
//   /// Should called when the user received a notification when app is opened or terminated:
//   /// - onMessage
//   /// - onBackgroundMessage
//   ///
//   /// #### This function is responsible for getting data when a notification is received.
//   static void onMessageReceived(Map<String, dynamic>? data) async {
//     debugPrint('- onMessageReceived');
//     return onMessageClicked(data, clicked: false);
//   }
// }
