import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/main/main_background.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainGalaxyBackground(
        child: Center(
          child: Text('Launch screen'),
        ),
      ),
    );
  }
}
