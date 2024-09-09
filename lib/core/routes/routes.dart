import 'package:edtech_app/feature/home/presentation/screens/home_screen.dart';
import 'package:edtech_app/feature/onboarding/presentation/screens/login_screen.dart';
import 'package:edtech_app/feature/onboarding/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/home';
  static const String signup = '/signup';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
