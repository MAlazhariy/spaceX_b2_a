import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/main/main_background.dart';
import 'package:spacex/features/rocket/view/widgets/rockets_view.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainGalaxyBackground(
        child: RocketsView(),
      ),
    );
  }
}
