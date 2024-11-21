import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/presentation/widgets/accounts_summary_indicators.ui.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class CurrentAccountCardUi extends StatelessWidget {
  const CurrentAccountCardUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: white,
        borderRadius: const BorderRadius.all(smallRadius).r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextUi.body3(
                  data: 'CURRENT ACCOUNT',
                  color: primary600,
                  fontFamily: semiBoldText,
                  height: 16.r / 12,
                ),
              ),
              ButtonPressAnimation(
                onTap: () {},
                child: SizedBox(
                  height: 16.r,
                  width: 20.r,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SvgIconUi(
                      ellipsisIcon,
                      height: 4.r,
                      width: 20.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap.x6(),
          const TextUi.body3(
            data: 'PROVIDUS BANK - 9906533917',
            color: primary300,
            fontFamily: mediumText,
          ),
          const Gap.x8(),
          TextUi.title1(
            span: TextSpan(
              text: 'N814,800',
              children: [
                TextSpan(
                  text: '.45',
                  style: title3.copyWith(
                    fontSize: 24,
                    fontFamily: mediumText,
                  ),
                ),
              ],
            ),
            fontFamily: mediumText,
          ),
          const Gap(12),
          const AccountSummaryIndicatorUi(),
        ],
      ),
    );
  }
}
