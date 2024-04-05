// import 'package:spacex/core/resources/app_images.dart';
// import 'package:spacex/core/widgets/main/main_background.dart';
// import 'package:spacex/core/widgets/main/main_button.dart';
// import 'package:spacex/core/utils/extensions/context_extension.dart';
// import 'package:spacex/core/resources/app_size.dart';
// import 'package:spacex/features/splash/bloc/settings_cubit.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MainBackground(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: AppSize.padding50),
//             // headline
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppSize.padding50,
//               ),
//               child: Text(
//                 'on_boarding_title'.tr(),
//                 style: context.styleBodyBold.copyWith(
//                   fontSize: AppSize.font36,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             // image
//             Expanded(
//               flex: 10,
//               child: Image.asset(
//                 AppImages.onBoarding,
//                 width: double.maxFinite,
//                 fit: BoxFit.fitWidth,
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//             const SizedBox(height: AppSize.paddingExtraLarge),
//
//             // subtitle
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppSize.padding50,
//               ),
//               child: Text(
//                 'on_boarding_description'.tr(),
//                 style: context.styleSubtitle.copyWith(
//                   fontSize: AppSize.fontSmall14,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const Spacer(),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: AppSize.padding50,
//               ),
//               child: StatefulBuilder(builder: (context, stState) {
//                 return MainButton(
//                   onPressed: () async {
//                     context.read<SettingsCubit>().setFirstLaunch();
//                     // pushAndFinish(context, const LoginScreen());
//                   },
//                   title: 'lets_start'.tr(),
//                 );
//               }),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
