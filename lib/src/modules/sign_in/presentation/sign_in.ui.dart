import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/modules/sign_in/controller/sign_in.controller.dart';
import 'package:prospa_assessment/src/modules/sign_in/presentation/widgets/form.ui.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/utility/ui_helpers.utils.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class SignInUi extends GetView<SignInController> {
  const SignInUi({super.key});

  @override
  SignInController get controller => Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removePrimaryFocusFromUiElement(context),
      child: Scaffold(
        backgroundColor: primary800,
        body: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Gap.x64(),
                      const TextUi.title1(
                        data: 'Welcome back Oluwaseun',
                        color: white,
                        fontFamily: semiBoldText,
                      ),
                      const Gap.x8(),
                      TextUi.body2(
                        span: TextSpan(
                          text: "Don't have an account with us? ",
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: body2.copyWith(color: brandSecondary),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                        color: white,
                      ),
                      const Gap.x24(),
                      const SignInFormUi(),
                      
                      const Gap.x30(),
                      ButtonUi.primary(
                        text: 'Sign in',
                        onPressed: controller.navigateToDashboard,
                      ),
                      const Gap(12),
                      const ButtonUi.ghost(
                        text: 'Forgot your password?',
                        foregroundColor: brandSecondary,
                      ),
                      const Gap.x64(),
                      ButtonPressAnimation(
                        onTap: () {},
                        child: SvgIconUi(
                          faceIdIcon,
                          height: 48.r,
                          width: 48.r,
                          color: white,
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
