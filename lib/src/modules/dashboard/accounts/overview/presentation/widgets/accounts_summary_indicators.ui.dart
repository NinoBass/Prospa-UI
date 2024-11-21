import 'package:flutter/material.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';


class AccountSummaryIndicatorUi extends StatelessWidget {
  const AccountSummaryIndicatorUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUi.body2(
              data: 'Money in',
              color: primary600,
              fontFamily: mediumText,
            ),
            Expanded(
              child: TextUi.body2(
                data: 'N450,000.00',
                color: success,
                fontFamily: semiBoldText,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Gap.x6(),
        LinearPercentIndicatorUi(
          percent: 1,
          color: success,
        ),
        Gap.x20(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUi.body2(
              data: 'Money out',
              color: primary600,
              fontFamily: mediumText,
            ),
            Expanded(
              child: TextUi.body2(
                data: 'N250,000.00',
                color: error,
                fontFamily: semiBoldText,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Gap.x6(),
        LinearPercentIndicatorUi(
          percent: .7,
          color: brandSecondary,
        ),
        Gap.x20(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUi.body2(
              data: 'Difference',
              color: primary600,
              fontFamily: mediumText,
            ),
            Expanded(
              child: TextUi.body2(
                data: 'N150,000.00',
                color: warning,
                fontFamily: semiBoldText,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        Gap.x6(),
        LinearPercentIndicatorUi(
          percent: .38,
          color: warning,
        ),
      ],
    );
  }
}
