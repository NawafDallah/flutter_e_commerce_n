import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/screen/forget_password.dart';
import '../../feature/auth/presentation/screen/login.dart';
import '../../feature/auth/presentation/screen/reset_password.dart';
import '../../feature/auth/presentation/screen/signup.dart';
import '../../feature/auth/presentation/screen/verifacation_code.dart';
import '../../feature/browse/presentation/screen/home.dart';
import '../../feature/on_boarding/presentation/bloc/on_boarding_providers.dart';
import 'routes.dart';

class AppRouter {
  const AppRouter._(); // to avoid initiate instance

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      /// ONBARDING PAGES
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingProviders());

      /// AUTH PAGES
      case Routes.login:
        return CupertinoPageRoute(builder: (_) => const Login());
      case Routes.signup:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (context) => const Signup());
      case Routes.forgetPassword:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => const ForgetPassword());
      case Routes.verifyCode:
        final args = routeSettings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (_) => VerificationCode(
                  email: args['email']!,
                  previousPage: args['previousPage']!,
                  userData: args["userData"],
                ));
      case Routes.resetPassword:
        return CupertinoPageRoute(
            builder: (_) => ResetPassword(
                  email: routeSettings.arguments as String,
                ));

      /// HOME PAGES
      case Routes.home:
        return CupertinoPageRoute(
          builder: (_) => const Home(),
        );
      default:
        return null;
    }
  }
}