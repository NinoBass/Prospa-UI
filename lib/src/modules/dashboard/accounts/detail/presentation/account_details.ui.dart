import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prospa_assessment/src/data/dtos/dto.dart';
import 'package:prospa_assessment/src/domain/extensions/datetime.extensions.dart';
import 'package:prospa_assessment/src/domain/services/services.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/detail/controller/account_details.controller.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/presentation/widgets/accounts_summary_indicators.ui.dart';
import 'package:prospa_assessment/src/modules/dashboard/transactions/overview/presentation/widgets/transaction_tile.ui.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/utility/ui_helpers.utils.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class AccountDetailsUi extends GetView<AccountDetailsController> {
  const AccountDetailsUi({super.key});

  @override
  AccountDetailsController get controller => Get.put(AccountDetailsController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removePrimaryFocusFromUiElement(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary600,
          leading: ButtonPressAnimation(
            onTap: navigationService.goBack,
            child: Center(
              child: SvgIconUi(
                closeIcon,
                height: 16.r,
                width: 16.r,
              ),
            ),
          ),
          actions: [
            ButtonPressAnimation(
              onTap:() => controller.openAccountOptionsModal(context),
              child: Container(
                height: 32.r,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                child: const TextUi.body3(
                  data: 'Options',
                  fontFamily: semiBoldText,
                  color: brandSecondary,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 6.r,
                width: 6.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: brandSecondary,
                ),
              ),
              const Gap.x8(),
              Container(
                height: 6.r,
                width: 6.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white.withOpacity(.4),
                ),
              ),
              const Gap.x8(),
              Container(
                height: 6.r,
                width: 6.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white.withOpacity(.4),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              color: primary600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap.x20(),
                  const TextUi(
                    data: 'SAVINGS ACC ***1234',
                    fontFamily: mediumText,
                    color: primary300,
                    textAlign: TextAlign.center,
                  ),
                  const Gap.x8(),
                  TextUi.title1(
                    span: TextSpan(
                      text: 'N75,539,342',
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
                    color: white,
                    fontFamily: mediumText,
                    textAlign: TextAlign.center,
                  ),
                  const Gap.x24(),
                ],
              ),
            ),
            Expanded(
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16).r,
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Gap.x24(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: AccountTransactionFilterUi(
                                    icon: exchangeIcon,
                                    name: 'Transfer',
                                    onTap: () {},
                                  ),
                                ),
                                Flexible(
                                  child: AccountTransactionFilterUi(
                                    icon: receiptIcon,
                                    name: 'Utilities',
                                    onTap: () {},
                                  ),
                                ),
                                Flexible(
                                  child: AccountTransactionFilterUi(
                                    icon: cardIcon,
                                    name: 'Card',
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            const Gap.x24(),
                            Container(
                              padding: const EdgeInsets.all(16).r,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Expanded(
                                        child: TextUi.body2(
                                          data: 'Summary',
                                          color: primary600,
                                          fontFamily: semiBoldText,
                                        ),
                                      ),
                                      const TextUi.body3(
                                        data: 'This month',
                                        color: primary300,
                                        fontFamily: mediumText,
                                      ),
                                      const Gap.x4(),
                                      ButtonPressAnimation(
                                        onTap: () {},
                                        child: Container(
                                          height: 16.r,
                                          width: 16.r,
                                          padding: const EdgeInsets.only(top: 2).r,
                                          alignment: Alignment.topCenter,
                                          child: SvgIconUi(
                                            downArrowIcon,
                                            width: 12.r,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap.x20(),
                                  const AccountSummaryIndicatorUi(),
                                ],
                              ),
                            ),
                            const Gap.x24(),
                            ...groupBy(
                              dummyTransactions,
                              (transaction) => DateTime(
                                transaction.dateCreated.year,
                                transaction.dateCreated.month,
                                transaction.dateCreated.day,
                              ),
                            ).entries.map(
                              (entry) {
                                final date = entry.key;
                                var convertedDate = '';
                                if (date.isToday) {
                                  convertedDate = 'Today';
                                } else if (date.isYesterday) {
                                  convertedDate = 'Yesterday';
                                } else {
                                  convertedDate = DateFormat('EEEE, d MMM yyyy').format(
                                    date.toLocal(),
                                  );
                                }
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Gap.x8(),
                                    TextUi.body2(
                                      data: convertedDate,
                                      fontFamily: mediumText,
                                      color: primary600,
                                    ),
                                    const Gap.x8(),
                                    SeparatedColumn(
                                      mainAxisSize: MainAxisSize.min,
                                      separatorBuilder: () => const Divider(height: 0, color: grayScale50),
                                      children: entry.value.map((transaction) {
                                        return TransactionsTileUi(transaction: transaction);
                                      }).toList(),
                                    ),
                                    const Gap(12),
                                  ],
                                );
                              },
                            ),
                            const Gap.x32(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTransactionFilterUi extends StatelessWidget {
  const AccountTransactionFilterUi({
    required this.onTap,
    required this.name,
    required this.icon,
    super.key,
  });

  final VoidCallback onTap;
  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ButtonPressAnimation(
      onTap: onTap,
      child: SizedBox(
        width: 54.r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 42.r,
              width: 42.r,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: brandSecondary,
              ),
              child: SvgIconUi(
                icon,
                color: white,
                height: 20.r,
                width: 20.r,
              ),
            ),
            const Gap.x8(),
            TextUi.body2(
              data: name,
              fontFamily: mediumText,
              color: brandSecondary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
