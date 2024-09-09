import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edtech_app/config/color/app_color.dart';
import 'package:edtech_app/feature/dashboard/bloc/dashboard_cubit.dart';
import 'package:edtech_app/feature/home/presentation/screens/home_screen.dart';
import 'package:edtech_app/feature/course/course_screen.dart';
import 'package:edtech_app/feature/live/live_scren.dart';
import 'package:edtech_app/feature/recorded/recorded_screen.dart';
import 'package:edtech_app/feature/ebooks/ebook_screen.dart';
import 'package:edtech_app/feature/success/success_screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const HomeScreen(),
    const CourseScreen(),
    const LiveScreen(),
    const RecordedScreen(),
    const EbooksScreen(),
    const SuccessScreen(),
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Scaffold(
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            int currentIndex = 0; // Default to Home tab

            if (state is DashboardTabChanged) {
              currentIndex = state.currentIndex;
            }

            // Return the screen based on the current tab
            return _screens[currentIndex];
          },
        ),
        // BottomNavigationBar
        bottomNavigationBar: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            int currentIndex = 0;

            if (state is DashboardTabChanged) {
              currentIndex = state.currentIndex;
            }

            return BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<DashboardCubit>().changeTab(index);
              },
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 28),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book, size: 28),
                  label: "Courses",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv, size: 28),
                  label: "Live",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library, size: 28),
                  label: "Recorded",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book, size: 28),
                  label: "E-books",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star, size: 28),
                  label: "Success",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
