import 'package:flutter/material.dart';
import 'package:spacex/core/widgets/section_title_widget.dart';
import 'package:spacex/features/home/view/widgets/capsule_item_builder.dart';
import 'package:spacex/features/home/view/widgets/next_launch_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NextLaunchWidget(),
        // todo: capsules
        SectionTitleWidget(
          title: 'Capsules',
          onTap: () {
            // todo: implement show all dragons in screen
          },
        ),
        const CapsuleItemBuilder(),
        // todo: dragons
        SectionTitleWidget(
          title: 'Dragons',
          onTap: () {
            // todo: implement show all dragons in screen
          },
        ),
        // todo: ships
        SectionTitleWidget(
          title: 'Ships',
          onTap: () {
            // todo: implement show all dragons in screen
          },
        ),
        // todo: all launches
        SectionTitleWidget(
          title: 'All launches',
          onTap: () {
            // todo: implement show all dragons in screen
          },
        ),
      ],
    );
  }
}
