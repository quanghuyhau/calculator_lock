
import 'package:calculator_lock/presentation/screens/flash/ui/onboarding_screen.dart';
import 'package:calculator_lock/utilities/routes/app_router.dart';
import 'package:calculator_lock/utilities/routes/route_define.dart';

class OnboardingRoute extends RouteDefine {
  @override
  Path initRoute(dynamic arguments) => Path(
    builder: (_) => const OnboardingScreen(),
  );

  @override
  String get routeName => 'flash';

  static push() {
    AppRouter.push(routeName: OnboardingRoute().routeName);
  }

  static popAndPush() {
    AppRouter.popAndPush(routeName: OnboardingRoute().routeName);
  }

  static clearAndPush() {
    AppRouter.popAndPush(routeName: OnboardingRoute().routeName);
  }
}
