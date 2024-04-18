// import 'package:spacex/core/widgets/bottom_sheet/show_custom_bottom_sheet.dart';
// import 'package:spacex/core/widgets/custom_dialog.dart';
// import 'package:spacex/core/widgets/main/main_button.dart';
// import 'package:spacex/core/utils/enums/request_status.dart';
// import 'package:spacex/core/utils/helper/navigation/push_and_finish.dart';
// import 'package:spacex/features/auth/bloc/auth_bloc/auth_bloc.dart';
// import 'package:spacex/features/auth/bloc/login_bloc/login_bloc.dart';
// import 'package:spacex/features/auth/view/screens/login_screen.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// Future<void> logout(BuildContext context) async {
//   await showCustomBottomSheet(
//     context: context,
//     title: 'logout'.tr(),
//     subTitle: 'want_logout'.tr(),
//     button: BlocConsumer<LoginBloc, LoginState>(
//       listener: (context, state) async {
//         if (state.logoutStatus.isSuccess) {
//           context.read<AuthBloc>().add(AuthLogoutRequestedEvent());
//           pushAndFinish(context, const LoginScreen());
//         } else if (state.logoutStatus.isError) {
//           await showCustomDialog(
//             context: context,
//             title: 'error_occurred_when_logout'.tr(),
//             description: state.logoutFailure?.message ?? '',
//             buttons: [
//               DialogButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 title: 'ok'.tr(),
//               ),
//             ],
//           );
//         }
//       },
//       listenWhen: (p, c) => p.logoutStatus != c.logoutStatus,
//       builder: (context, state) {
//         return MainButton(
//           title: 'confirm'.tr(),
//           loading: state.logoutStatus.isLoading,
//           onPressed: () {
//             context.read<LoginBloc>().add(LogoutEvent());
//           },
//         );
//       },
//       buildWhen: (p, c) => p.logoutStatus != c.logoutStatus,
//     ),
//   );
// }
