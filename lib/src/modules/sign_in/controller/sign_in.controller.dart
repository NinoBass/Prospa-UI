import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/domain/services/navigation.services.dart';

class SignInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> signInFormKey;

  @override
  void onInit() {
    FlutterNativeSplash.remove();
    signInFormKey = GlobalKey<FormState>(debugLabel: 'Sign in');
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onClose();
  }

  void navigateToDashboard() {
    navigationService.navigateToReplace(
      Routes.dashboard,
    );
  }
}
