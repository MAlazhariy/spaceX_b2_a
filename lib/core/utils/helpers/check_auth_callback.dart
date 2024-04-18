// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spacex/core/constants.dart';
// import 'package:spacex/features/auth/bloc/auth_bloc/auth_bloc.dart';
// import 'package:spacex/features/auth/view/screens/login_screen.dart';
//
// Future<void> checkAuthCallback(void Function() callback) async {
//   final context = navigatorKey.currentContext!;
//   if (context.read<AuthBloc>().state.status.isAuthenticated) {
//     callback.call();
//   } else {
//     await showCustomDialog(
//       context: context,
//       title: 'not_logged_in'.tr(),
//       description: 'login_first'.tr(),
//       buttons: [
//         DialogButton(
//           onPressed: () async {
//             Navigator.pop(context);
//             pushTo(navigatorKey.currentContext!, const LoginScreen());
//           },
//           title: 'login'.tr(),
//         ),
//       ],
//     );
//   }
// }
