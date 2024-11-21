import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:prospa_assessment/bootstrapper.dart';
import 'package:prospa_assessment/prospa.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await AppBootstrapper.init(
    mainAppWidget: const ProspaApp(),
    runApp: runApp,
  );
}
