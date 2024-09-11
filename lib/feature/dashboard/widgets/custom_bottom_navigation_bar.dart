import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edtech_app/config/color/app_color.dart';
import 'package:edtech_app/feature/dashboard/bloc/dashboard_cubit.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _shadowAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _shadowAnimation = Tween<double>(begin: 4.0, end: 10.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        int currentIndex = 0;

        if (state is DashboardTabChanged) {
          currentIndex = state.currentIndex;
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: 8.0,
          ),
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor.withOpacity(0.8),
                  AppColors.secondaryColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              elevation: 0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.transparent,
              child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildNavItem(
                      context,
                      icon: Icons.school,
                      label: "Education",
                      index: 0,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.trending_up,
                      label: "Trade",
                      index: 1,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.stacked_bar_chart,
                      label: "Practice",
                      index: 2,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.bar_chart,
                      label: "Live",
                      index: 3,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.show_chart,
                      label: "Insights",
                      index: 4,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.account_balance_wallet,
                      label: "Portfolio",
                      index: 5,
                      currentIndex: currentIndex,
                    ),
                    _buildNavItem(
                      context,
                      icon: Icons.person,
                      label: "Profile",
                      index: 6,
                      currentIndex: currentIndex,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
  }) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: () {
        context.read<DashboardCubit>().changeTab(index);
        _animationController.forward().then((_) => _animationController.reverse());
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: isSelected ? _scaleAnimation.value : 1.0,
            child: Transform.rotate(
              angle: isSelected ? _rotationAnimation.value * 0.5 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            AppColors.primaryColor.withOpacity(0.9),
                            AppColors.secondaryColor.withOpacity(0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isSelected ? 0.2 : 0.0),
                      blurRadius: _shadowAnimation.value,
                      spreadRadius: 1.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _opacityAnimation.value,
                      child: Icon(
                        icon,
                        size: isSelected ? 36 : 28,
                        color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 6),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _opacityAnimation.value,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.15,
                        ),
                        child: Text(
                          label,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
