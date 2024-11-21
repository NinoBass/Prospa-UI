import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/domain/services/navigation.services.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';

class ProspaApp extends StatelessWidget {
  const ProspaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Prospa';
    const showDebugBanner = false;

    return GetMaterialApp(
      title: title,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      navigatorKey: navigationService.navigatorKey,
      debugShowCheckedModeBanner: showDebugBanner,
      defaultTransition: Transition.fadeIn,
      transitionDuration: 200.milliseconds,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        brightness: Brightness.light,
        primaryColor: primary600,
        colorScheme: const ColorScheme.light(
          primary: primary600,
          secondary: brandSecondary,
        ),
        scaffoldBackgroundColor: primary50,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Typography.englishLike2021.apply(
          fontFamily: 'BRFirmaRegular',
          bodyColor: primary600,
          displayColor: primary600,
        ),
      ),
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
        );

        return child ?? Container();
      },
      onUnknownRoute: (settings) {
        FlutterNativeSplash.remove();
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold();
          },
        );
      },
    );
  }
}
