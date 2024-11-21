import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearPercentIndicatorUi extends StatelessWidget {
  const LinearPercentIndicatorUi({
    required this.percent,
    this.color,
    super.key,
  }) : assert(
          percent >= 0.0 && percent <= 1.0,
          'percent cannot be less than 0 or greater than 1',
        );

  final double percent;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 3.r,
      percent: percent.isNaN ? 0.015 : percent.clamp(0.015, 1), // use .015 as base so abit of the indicator is visible
      padding: EdgeInsets.zero,
      barRadius: Radius.zero,
      backgroundColor: color?.withOpacity(.2),
      progressColor: color,
      animation: true,
      animateFromLastPercent: true,
      animationDuration: 800,
    );
  }
}
