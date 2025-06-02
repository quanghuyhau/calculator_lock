import 'package:calculator_lock/generated/l10n.dart';
import 'package:calculator_lock/manifest.dart';
import 'package:calculator_lock/presentation/screens/flash/onboarding_route.dart';
import 'package:calculator_lock/presentation/screens/login/login_route.dart';
import 'package:calculator_lock/utilities/routes/route_define.dart';
import 'package:calculator_lock/utilities/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  String initRoute = OnboardingRoute().routeName;

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      timeStamp: DateTime.now().millisecondsSinceEpoch,
      child: GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: Get.deviceLocale,
        theme: ThemeData(
          brightness: brightness,
        ),
        fallbackLocale: const Locale('vi'),
        initialRoute: initRoute,
        onGenerateRoute: (settings) => manifest(generateRoutes, settings),
        builder: EasyLoading.init(),
      ),
    );
  }
}
