import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prospa_assessment/src/data/dtos/dto.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class TransactionsTileUi extends StatelessWidget {
  const TransactionsTileUi({
    required this.transaction,
    super.key,
  });

  final TransactionDto transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14).r,
      child: Row(
        children: [
          Container(
            height: 40.r,
            width: 40.r,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primary50,
            ),
            child: SvgIconUi(
              transaction.icon,
              height: 16.r,
              width: 16.r,
            ),
          ),
          const Gap.x16(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextUi.body2(
                  data: transaction.description,
                  color: primary600,
                  fontFamily: semiBoldText,
                ),
                const Gap.x4(),
                TextUi.body3(
                  data: transaction.time,
                  color: primary300,
                  fontFamily: mediumText,
                ),
              ],
            ),
          ),
           TextUi.body2(
            data:'-N${transaction.amount}',
            color: primary600,
            fontFamily: mediumText,
          ),
        ],
      ),
    );
  }
}
