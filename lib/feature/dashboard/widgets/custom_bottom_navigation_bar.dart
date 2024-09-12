import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edtech_app/config/color/app_color.dart';
import 'package:edtech_app/feature/dashboard/bloc/dashboard_cubit.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardTabChanged) {
          _selectedIndex = state.currentIndex;
        }

        return BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          itemCornerRadius: 16,
          backgroundColor: Colors.white,
          onItemSelected: (index) {
            setState(() => _selectedIndex = index);
            context.read<DashboardCubit>().changeTab(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.school),
              title: Text('Education'),
              activeColor: AppColors.primaryColor,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.trending_up),
              title: Text('Trade'),
              activeColor: AppColors.secondaryColor,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.bar_chart),
              title: Text('Live'),
              activeColor: Colors.orangeAccent,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text('Portfolio'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Colors.teal,
              inactiveColor: Colors.grey,
            ),
          ],
        );
      },
    );
  }
}
