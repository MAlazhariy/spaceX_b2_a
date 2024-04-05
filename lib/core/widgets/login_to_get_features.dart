// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:spacex/core/utils/helpers/navigation/push_to.dart';
// import 'package:spacex/features/auth/view/screens/login_screen.dart';
//
// class LoginToGetFeaturesWidget extends StatelessWidget {
//   const LoginToGetFeaturesWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           '${'not_logged_in'.tr()} ..!\n${'login_to_get_app_features'.tr()}',
//           textAlign: TextAlign.center,
//         ),
//         TextButton(
//           child: Text('login'.tr()),
//           onPressed: () async {
//             pushTo(context, const LoginScreen());
//           },
//         ),
//       ],
//     );
//   }
// }
