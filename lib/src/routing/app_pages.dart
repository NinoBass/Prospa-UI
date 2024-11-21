import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/presentation/views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signIn;

  static final pages = <GetPage<dynamic>>[
    prospaMainPage(
      name: Routes.signIn,
      page: () => const SignInUi(),
    ),
    prospaMainPage(
      name: Routes.dashboard,
      page: () => const DashboardUi(),
    ),
    prospaMainPage(
      name: Routes.accountDetails,
      page: () => const AccountDetailsUi(),
    ),
  ];
}

GetPage<T> prospaMainPage<T>({
  required String name,
  required Widget Function() page,
  List<GetMiddleware>? middlewares,
  Transition transition = Transition.rightToLeft,
  Duration transitionDuration = const Duration(milliseconds: 250),
  Curve curve = Curves.fastEaseInToSlowEaseOut,
  bool? popGesture,
}) {
  return GetPage<T>(
    name: name,
    curve: curve,
    transition: transition,
    page: page,
    popGesture: popGesture,
    transitionDuration: transitionDuration,
    middlewares: middlewares,
  );
}
