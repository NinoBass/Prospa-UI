import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/controller/accounts_overview.controller.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/presentation/widgets/current_account_card.ui.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/presentation/widgets/header.ui.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/presentation/widgets/promo_section.ui.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/presentation/widgets/savings_account_card.ui.dart';
import 'package:prospa_assessment/src/modules/dashboard/transactions/overview/presentation/widgets/recent_transactions.ui.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/utility/ui_helpers.utils.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class AccountsOverviewUi extends GetView<AccountsOverviewController> {
  const AccountsOverviewUi({super.key});

  @override
  AccountsOverviewController get controller => Get.put(AccountsOverviewController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removePrimaryFocusFromUiElement(context),
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                height: kToolbarHeight + context.height * .20,
                width: context.width,
                color: primary600,
              ),
              Positioned.fill(
                child: SafeArea(
                  child: Column(
                    children: [
                      const Gap.x16(),
                      const AccountsOverviewHeaderUi(),
                      const Gap.x8(),
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.symmetric(horizontal: 16).r,
                              sliver: SliverFillRemaining(
                                hasScrollBody: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    const Gap.x8(),
                                    const CurrentAccountCardUi(),
                                    const Gap.x16(),
                                    const SavingsAccountCardUi(),
                                    const Gap.x16(),
                                    ButtonPressAnimation(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(16).r,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(smallRadius).r,
                                          gradient: const RadialGradient(
                                            center: Alignment(1.1, 1.1),
                                            radius: 5,
                                            transform: GradientRotation(1.8 / pi),
                                            colors: [
                                              brandTertiary,
                                              brandPrimary,
                                              brandSecondary,
                                            ],
                                            stops: [0, 0.51, 1],
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Expanded(
                                              child: TextUi.body2(
                                                data: 'Create multiple sub-accounts and manage your money with ease!',
                                                color: white,
                                                fontFamily: mediumText,
                                              ),
                                            ),
                                            const Gap.x16(),
                                            Container(
                                              height: 40.r,
                                              width: 40.r,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                color: white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: SvgIconUi(
                                                plusIcon,
                                                height: 16.r,
                                                width: 20.r,
                                                color: brandSecondary, 
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Gap.x16(),
                                    const RecentTransactionsCardUi(),
                                    const Gap.x16(),
                                    const PromoSectionUi(),
                                    const Gap.x32(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
