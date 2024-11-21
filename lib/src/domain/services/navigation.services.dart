import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//add export for app pages since this is the navigation service :)
export 'package:prospa_assessment/src/routing/app_pages.dart';

final navigationService = Get.find<NavigationService>();

class NavigationService extends GetxService {
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  void onInit() {
    navigatorKey = GlobalKey<NavigatorState>();
    super.onInit();
  }

  BuildContext get navigationContext => navigatorKey.currentContext!;

  bool get canGoBack => navigatorKey.currentState?.canPop() ?? false;

  Future<dynamic>? navigateTo(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamed<dynamic>(
      routeName,
      arguments: arguments,
    );
  }

  Future<void> navigateToReplace(
    String routeName, {
    dynamic arguments,
  }) async {
    return navigatorKey.currentState?.pushReplacementNamed<void, void>(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic>? popAndPushNamed<T>(
    String routeName, {
    Object? result,
    Object? arguments,
  }) async {
    return navigationService.navigatorKey.currentState?.popAndPushNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  void popUntil(String endRoute) {
    return navigatorKey.currentState?.popUntil(
      (route) => route.settings.name == endRoute,
    );
  }

  Future<void> navigateToAndRemoveUntil(
    String routeName, {
    dynamic arguments,
    String? endRoute,
  }) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil<void>(
      routeName,
      (route) {
        if (endRoute != null) {
          return route.settings.name == endRoute;
        }
        return false;
      },
      arguments: arguments,
    );
  }

  void goBack({dynamic result}) {
    if (canGoBack) {
      return navigatorKey.currentState?.pop(result);
    }
  }
}
