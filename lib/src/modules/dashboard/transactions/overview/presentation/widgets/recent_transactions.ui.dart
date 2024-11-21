import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prospa_assessment/src/data/dtos/dto.dart';
import 'package:prospa_assessment/src/modules/dashboard/transactions/overview/presentation/widgets/transaction_tile.ui.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class RecentTransactionsCardUi extends StatelessWidget {
  const RecentTransactionsCardUi({
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
              const Expanded(
                child: TextUi.body2(
                  data: 'Recent transactions',
                  color: primary600,
                  fontFamily: semiBoldText,
                ),
              ),
              ButtonPressAnimation(
                onTap: () {},
                child: SvgIconUi(
                  rightArrowIcon,
                  height: 16.r,
                  width: 16.r,
                ),
              ),
            ],
          ),
          const Gap.x4(),
          SeparatedColumn(
            mainAxisSize: MainAxisSize.min,
            separatorBuilder: () => const Divider(height: 0, color: grayScale50),
            children: dummyTransactions.take(3).map(
              (transaction) {
                return TransactionsTileUi(transaction: transaction);
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
