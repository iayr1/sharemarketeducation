import 'package:edtech_app/feature/education/presentation/screens/education_screen.dart';
import 'package:edtech_app/feature/live/live_trading_screen.dart';
import 'package:edtech_app/feature/market/market_screen.dart';
import 'package:edtech_app/feature/portfolio/portfolio_screen.dart';
import 'package:edtech_app/feature/practice/practice_screen.dart';
import 'package:edtech_app/feature/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edtech_app/config/color/app_color.dart';
import 'package:edtech_app/feature/dashboard/bloc/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const EducationScreen(),
    const PracticeScreen(),
    const LiveTradingScreen(),
    const PortfolioScreen(),
    const MarketScreen(),
    const ProfileScreen(),
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Scaffold(
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            int currentIndex = 0; 
            
            if (state is DashboardTabChanged) {
              currentIndex = state.currentIndex;
            }
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
                  label: "Education",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book, size: 28),
                  label: "Practice",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv, size: 28),
                  label: "Live",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library, size: 28),
                  label: "Portfolio",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book, size: 28),
                  label: "Market",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star, size: 28),
                  label: "Profile",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

