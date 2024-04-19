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
      onTap: (){
        // todo: show bottomSheet details
      },
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.all(AppSize.paddingLarge),
        padding: const EdgeInsets.all(AppSize.paddingLarge),
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

            return Column(
              children: [
                Text(
                  'Next launch',
                  style: context.styleHeader1,
                ),
                const SizedBox(height: AppSize.paddingLarge),

                // count down
                const LaunchCountDownWidget(
                  countDownDuration: Duration(days: 1, hours: 2, minutes: 24),
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
