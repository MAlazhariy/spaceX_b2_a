import 'package:flutter/material.dart';

import '../../../../core/widgets/main/main_circular_progress_adaptive.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MainCircularProgress(color: Colors.yellow),
    );
  }
}