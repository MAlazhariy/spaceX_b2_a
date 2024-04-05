// import 'package:spacex/core/utils/constants.dart';
// import 'package:spacex/core/utils/enums/role_enum.dart';
// import 'package:spacex/core/utils/helper/navigation/push_and_finish.dart';
// import 'package:spacex/features/auth/bloc/auth_bloc/auth_bloc.dart';
// import 'package:spacex/features/dashboard/view/cubit/dashboard_cubit.dart';
// import 'package:spacex/features/dashboard/view/screens/dashboard_screen.dart';
// import 'package:spacex/features/user/package/bloc/package_bloc/package_bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// Future<void> onOrderStatusAccepted(Map<String, dynamic> data, {bool clicked = true}) async {
//   debugPrint('- onOrderStatusAccepted');
//   final context = navigatorKey.currentContext;
//   debugPrint('context: $context');
//   if (context == null) return;
//   // ensure that the user is authenticated & is user role
//   final user = context.read<AuthBloc>().checkUserRole();
//   user.fold(
//     (l) => null,
//     (r) async {
//       if (r?.isUser == true) {
//         // get orders
//         context.read<PackageBloc>().add(GetMyPackagesEvent(ifNotExists: false));
//         context.read<PackageBloc>().add(GetMyPrevPackagesEvent(ifNotExists: false));
//         if(clicked){
//           // navigate to orders screen
//           context.read<PackageBloc>().add(UpdateMyOrdersIndexEvent(index: 1));
//           pushAndFinish(context, const DashboardScreen());
//           context.read<DashboardCubit>().updateIndex(1);
//           final reservationId = int.tryParse(data['reservation_id']);
//           await Future.delayed(const Duration(milliseconds: 1300));
//           navigatorKey.currentContext?.read<PackageBloc>().add(SetFinishedWashIdEvent(id: reservationId));
//         }
//       }
//     },
//   );
// }
