import 'package:spacex/core/resources/app_images.dart';
import 'package:spacex/core/utils/helpers/navigation/push_and_finish.dart';
import 'package:spacex/features/splash/bloc/settings_cubit.dart';
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
    //
    // context.read<SettingsCubit>().close();
    pushAndFinish(context, const DashboardScreen());
  }

  Future<void> _delayNavigate(BuildContext context) async {
    if (!mounted) return;
    return await Future.delayed(const Duration(milliseconds: 1000), () => _navigate(context));
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
        child: Image.asset(
          AppImages.logo,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
