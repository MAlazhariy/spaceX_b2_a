import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex/core/resources/app_images.dart';
import 'package:spacex/core/utils/common/system_overlay_style.dart';
import 'package:spacex/core/utils/helpers/navigation/push_and_finish.dart';
import 'package:spacex/features/home/view/screens/home_screen.dart';
import 'package:spacex/features/rocket/view/screens/rockets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/dashboard/view/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigate(BuildContext context) async {
    if (!mounted) return;
    // if (context.read<SettingsCubit>().isFirstLaunch()) {
    //   return pushAndFinish(context, const OnBoardingScreen());
    // }
    /**/
    // context.read<SettingsCubit>().close();
    /**/
    // pushAndFinish(context, const RocketsScreen());
    pushAndFinish(context, const HomeScreen());
    // pushAndFinish(context, const DashboardScreen());
  }

  Future<void> _delayNavigate(BuildContext context) async {
    if (!mounted) return;
    return await Future.delayed(const Duration(milliseconds: 6800), () => _navigate(context));
  }

  @override
  void initState() {
    _delayNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(
              AppLottie.splashBackground,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // logo
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.letterMarkLogo,
                  color: Colors.white,
                  width: 260,
                  fit: BoxFit.fill,
                ).animate(delay: 1.7.seconds).fade(duration: 2.seconds).scale(duration: 1.3.seconds),
                // .shake(
                //   delay: 1.7.seconds,
                //   offset: const Offset(1, 0.2),
                //   rotation: 0.1,
                //   duration: 0.4.seconds,
                // ),
                /**/
                // Padding(
                //   padding: const EdgeInsets.only(
                //     right: AppSize.paddingLarge,
                //   ),
                //   child: Text(
                //     'Imagine the Future!',
                //     style: TextStyle(
                //       color: Colors.white,
                //       // fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
