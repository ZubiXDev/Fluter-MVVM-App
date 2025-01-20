import 'package:bingo/utils/routes/routes_name.dart';
import 'package:bingo/view/home_view.dart';
import 'package:bingo/view/login_view.dart';
import 'package:bingo/view/signup_view.dart';
import 'package:bingo/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> gerenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Routes Defined'),
            ),
          );
        });
    }
  }
}
