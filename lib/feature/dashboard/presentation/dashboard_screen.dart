// dashboard_screen.dart
import 'package:edtech_app/feature/dashboard/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edtech_app/feature/dashboard/bloc/dashboard_cubit.dart';
import 'package:edtech_app/feature/education/presentation/screens/education_screen.dart';
import 'package:edtech_app/feature/practice/practice_screen.dart';
import 'package:edtech_app/feature/live/live_trading_screen.dart';
import 'package:edtech_app/feature/portfolio/portfolio_screen.dart';
import 'package:edtech_app/feature/market/market_screen.dart';
import 'package:edtech_app/feature/profile/presentation/pages/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const EducationScreen(),
    const PracticeScreen(),
    const LiveTradingScreen(),
    const PortfolioScreen(),
    const MarketScreen(),
    ProfileScreen(),
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
        bottomNavigationBar: const CustomBottomNavigationBar(), // Use the new widget
      ),
    );
  }
}
