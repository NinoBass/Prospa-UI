import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/modules/dashboard/accounts/overview/controller/accounts_overview.controller.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class SavingsAccountCardUi extends GetView<AccountsOverviewController> {
  const SavingsAccountCardUi({
    super.key,
  });

  @override
  AccountsOverviewController get controller => Get.put(AccountsOverviewController());
  
  @override
  Widget build(BuildContext context) {
    return ButtonPressAnimation(
      onTap: controller.openSavingsAccountPage,
      child: Container(
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.all(smallRadius).r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextUi.body3(
                        data: 'SAVINGS ACCOUNT',
                        color: primary600,
                        fontFamily: semiBoldText,
                      ),
                      Gap.x6(),
                      TextUi.body3(
                        data: 'SUB ACCOUNT - 12346789',
                        color: primary300,
                        fontFamily: mediumText,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12).r,
                  decoration: BoxDecoration(
                    color: brandPrimary.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgIconUi(
                    cardIcon,
                    height: 16.r,
                    width: 20.r,
                    color: brandPrimary,
                  ),
                ),
              ],
            ),
            const Gap.x16(),
            TextUi.title1(
              span: TextSpan(
                text: 'N39,342',
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
          ],
        ),
      ),
    );
  }
}
