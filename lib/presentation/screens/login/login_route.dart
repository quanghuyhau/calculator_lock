import 'package:calculator_lock/di/di.dart';
import 'package:calculator_lock/presentation/screens/login/cubit/login_cubit.dart';
import 'package:calculator_lock/presentation/screens/login/ui/login_screen.dart';
import 'package:calculator_lock/utilities/routes/app_router.dart';
import 'package:calculator_lock/utilities/routes/route_define.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginRoute extends RouteDefine {
  @override
  Path initRoute(dynamic arguments) => Path(
        builder: (_) => BlocProvider<LoginCubit>(
          create: (_) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      );

  @override
  String get routeName => 'login';

  static push() {
    AppRouter.push(routeName: LoginRoute().routeName);
  }

  static popAndPush() {
    AppRouter.popAndPush(routeName: LoginRoute().routeName);
  }

  static clearAndPush() {
    AppRouter.popAndPush(routeName: LoginRoute().routeName);
  }
}
