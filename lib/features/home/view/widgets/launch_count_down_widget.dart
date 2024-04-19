import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';

class LaunchCountDownWidget extends StatefulWidget {
  const LaunchCountDownWidget({
    super.key,
    required this.countDownDuration,
  });

  final Duration countDownDuration;

  @override
  State<LaunchCountDownWidget> createState() => _LaunchCountDownWidgetState();
}

class _LaunchCountDownWidgetState extends State<LaunchCountDownWidget> {
  // late final StreamDuration streamDuration;
  //
  // @override
  // void initState() {
  //   streamDuration = StreamDuration(
  //     config: StreamDurationConfig(
  //       countDownConfig: CountDownConfig(duration: widget.countDownDuration),
  //     ),
  //   );
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   streamDuration.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppSize.paddingExtraSmall,
          ),
          child: Text(
            'Launch after:',
          ),
        ),
        SlideCountdown(
          duration: widget.countDownDuration,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.radiusLarge),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.paddingSmall,
            horizontal: AppSize.paddingLarge,
          ),
          style: context.styleHeader1.copyWith(
            color: kTitleDarkColor,
          ),
          durationTitle: const DurationTitle(
            seconds: 'sec',
            days: 'days',
            hours: 'hours',
            minutes: 'minutes',
          ),
          separatorStyle: context.styleBodyBold.copyWith(
            color: kTitleDarkColor,
          ),
        ),
      ],
    );

    // return RawSlideCountdown(
    //   streamDuration: streamDuration,
    //   builder: (context, duration, countUp) {
    //     return Row(
    //       children: [
    //         RawDigitItem(
    //           duration: duration,
    //           timeUnit: TimeUnit.days,
    //           digitType: DigitType.first,
    //           countUp: countUp,
    //         ),
    //         RawDigitItem(
    //           duration: duration,
    //           timeUnit: TimeUnit.hours,
    //           digitType: DigitType.second,
    //           countUp: countUp,
    //         ),
    //         RawDigitItem(
    //           duration: duration,
    //           timeUnit: TimeUnit.minutes,
    //           digitType: DigitType.daysHundred,
    //           countUp: countUp,
    //         ),
    //         RawDigitItem(
    //           duration: duration,
    //           timeUnit: TimeUnit.seconds,
    //           digitType: DigitType.second,
    //           countUp: countUp,
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
