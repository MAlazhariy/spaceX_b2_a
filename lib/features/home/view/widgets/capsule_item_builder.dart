import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/enums/request_status.dart';
import 'package:spacex/core/widgets/main/main_circular_progress_adaptive.dart';
import 'package:spacex/features/capsules/logic/capsule_bloc.dart';

class CapsuleItemBuilder extends StatelessWidget {
  const CapsuleItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CapsuleBloc, CapsuleState>(
      builder: (context, state) {
        if (state.capsulesStatus.isLoading) {
          return const Center(child: MainCircularProgress());
        } else if (state.capsulesStatus.isError) {
          return Text(state.capsulesFailure?.message ?? 'Error occurred!');
        }

        return SizedBox(
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.capsules.length,
            itemBuilder: (context, index) {
              // todo: show widget item builder here
              final capsule = state.capsules[index];
              return Container(
                child: Text(capsule.serial),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: AppSize.paddingSmall),
          ),
        );
      },
    );
  }
}
