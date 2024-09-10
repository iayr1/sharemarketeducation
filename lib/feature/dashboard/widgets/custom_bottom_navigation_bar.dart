import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edtech_app/config/color/app_color.dart';
import 'package:edtech_app/feature/dashboard/bloc/dashboard_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        int currentIndex = 0;

        if (state is DashboardTabChanged) {
          currentIndex = state.currentIndex;
        }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor.withOpacity(0.8), AppColors.secondaryColor.withOpacity(0.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: SizedBox(
            height: 80, // Increase the height of the BottomNavigationBar
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<DashboardCubit>().changeTab(index);
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.7),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent, // Make the background color transparent
              elevation: 0, // Remove the default elevation
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.school, size: 30), // Increase icon size
                  label: "Education",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_run, size: 30), // Increase icon size
                  label: "Practice",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up, size: 30), // Increase icon size
                  label: "Live Trading",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart, size: 30), // Increase icon size
                  label: "Portfolio",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart, size: 30), // Increase icon size
                  label: "Market Insights",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 30), // Increase icon size
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
