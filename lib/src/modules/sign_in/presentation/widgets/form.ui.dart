import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:get/get.dart';
import 'package:prospa_assessment/src/modules/sign_in/controller/sign_in.controller.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/ui_helpers.utils.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class SignInFormUi extends GetView<SignInController> {
  const SignInFormUi({super.key});

  @override
  SignInController get controller => Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removePrimaryFocusFromUiElement(context),
      child: Form(
        key: controller.signInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldUi(
              controller: controller.emailController,
              hintText: 'Enter email address',
              labelText: 'Email address',
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              inputFormatter: [
                FilteringTextInputFormatter.allow(
                  RegExp('[a-zA-Z@0-9._ ]'),
                ),
              ],
              autofillHints: const [
                AutofillHints.email,
              ],
            ),
            const Gap.x30(),
            ObxValue(
              (obscureText) => TextFieldUi(
                controller: controller.passwordController,
                hintText: 'Enter password',
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                autofocus: true,
                obscureText: obscureText.value,
                autofillHints: const [
                  AutofillHints.password,
                ],
                suffixIcon: GestureDetector(
                  onTap: obscureText.toggle,
                  child: TextUi.body3(
                    data: obscureText.value ? 'Show' : 'Hide',
                    fontFamily: mediumText,
                    color: white,
                  ),
                ),
              ),
              true.obs,
            ),
          ],
        ),
      ),
    );
  }
}
