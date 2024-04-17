import 'package:spacex/features/dashboard/view/widgets/bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/dashboard/view/cubit/dashboard_cubit.dart';
import 'package:spacex/features/home/view/screens/home_screen.dart';
import 'package:spacex/features/launches/view/screens/launches_screen.dart';
import 'package:spacex/features/rocket/view/screens/rockets_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const LaunchScreen(),
    // todo: zak - where's the <const>?
     RocketsScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, int>(
      builder: (context, index) {
        return Scaffold(
          body: _screens[index],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          bottomNavigationBar: CustomBottomBar(
            currentIndex: index,
            onTap: (i) => context.read<DashboardCubit>().updateIndex(i),
            items: [
              /// Home
              CustomBottomBarItem(
                icon: const Icon(Icons.home),
                title: "home_screen".tr(),
              ),

              /// Profile
              CustomBottomBarItem(
                icon: const Icon(Icons.notes),
                title: "my_orders".tr(),
              ),

              /// Profile
              CustomBottomBarItem(
                icon: const Icon(Icons.add),
                title: "profile".tr(),
              ),
            ],
          ),
        );
      },
      buildWhen: (p, c) => c >= 0,
    );
  }
}
