import 'package:calculator_lock/presentation/application/application.dart';
import 'package:calculator_lock/utilities/ultils/logging.dart';
import 'package:calculator_lock/utilities/ultils/ultis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'di/di.dart';
import 'di/environment/build_config.dart';


const env =
    String.fromEnvironment('FLUTTER_APP_FLAVOR', defaultValue: CustomEnv.uat);

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Log.setLevel(env: env);

  await Utils.initSystemInfo();

  await configureDependencies(env: env);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterNativeSplash.remove();

  runApp(const Application());
}
