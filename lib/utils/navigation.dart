import 'package:edtech_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:edtech_app/screens/auth/login_screen.dart';
import 'package:edtech_app/screens/auth/signup_screen.dart';
import 'package:edtech_app/screens/widgets/dashboard_screen_course_card.dart';
import '../screens/dashboard/course_player_screen.dart';
import '../screens/dashboard/dashboard_courses_screen.dart';

class Navigation {
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String dashboardRoute = '/dashboard';
  static const String coursePlayerRoute = '/coursePlayer';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_) => EnrolledCoursesScreen());
      case coursePlayerRoute:
      // You may need to extract course data from settings.arguments
      // and pass it to CoursePlayerScreen constructor
        return MaterialPageRoute(
          builder: (_) => CoursePlayerScreen(
            course: settings.arguments as Course, // Replace YourCourseType with the actual type of your course
          ),
        );
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
