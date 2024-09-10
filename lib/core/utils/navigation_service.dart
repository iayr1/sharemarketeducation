import 'package:edtech_app/feature/education/presentation/screens/education_screen.dart';
import 'package:edtech_app/feature/onboarding/presentation/screens/login_screen.dart';
import 'package:edtech_app/feature/onboarding/presentation/screens/signup_screen.dart';
import 'package:edtech_app/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class Navigation {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String dashboardRoute = '/dashboard';
  static const String coursePlayerRoute = '/coursePlayer';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => const EducationScreen());
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