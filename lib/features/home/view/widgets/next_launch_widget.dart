import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/enums/request_status.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/widgets/main/main_circular_progress_adaptive.dart';
import 'package:spacex/features/home/view/widgets/launch_count_down_widget.dart';
import 'package:spacex/features/launches/logic/launch_bloc.dart';

class NextLaunchWidget extends StatelessWidget {
  const NextLaunchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo: show bottomSheet details
        // get launch details from id (LaunchBloc)
        // show launch details in bottom sheet or custom screen
      },
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.all(AppSize.paddingLarge),
        padding: const EdgeInsets.symmetric(
          vertical: AppSize.paddingLarge,
          horizontal: AppSize.paddingExtraLarge,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.radiusDefault),
          color: Colors.white54,
        ),
        child: BlocBuilder<LaunchBloc, LaunchState>(
          builder: (context, state) {
            if (state.nextLaunchStatus.isLoading) {
              return const Center(child: MainCircularProgress());
            } else if (state.nextLaunchStatus.isError) {
              return Text(state.nextLaunchFailure?.message ?? '');
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next launch',
                        style: context.styleHeader1,
                      ),
                      const SizedBox(height: AppSize.paddingSmall),

                      // countdown
                      const LaunchCountDownWidget(
                        countDownDuration: Duration(days: 1, hours: 2, minutes: 24),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSize.paddingDefault),
                const Icon(
                  Icons.rocket_launch,
                  color: Colors.white,
                  size: 50,
                ),
              ],
            );
          },
          buildWhen: (p, c) => p.nextLaunchStatus != c.nextLaunchStatus,
        ),
      ),
    );
  }
}
