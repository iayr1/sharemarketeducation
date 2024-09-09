import 'package:edtech_app/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edtech_app/config/color/app_color.dart';
import 'package:edtech_app/config/gradient/app_gradient.dart';
import 'package:edtech_app/core/routes/routes.dart';
import 'package:edtech_app/feature/onboarding/presentation/bloc/login_cubit.dart';
import 'package:edtech_app/feature/onboarding/presentation/bloc/login_state.dart';
import 'package:edtech_app/feature/onboarding/presentation/widgets/auth_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.loginSignUpGradient,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                } else if (state is LoginFailure) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error', style: TextStyle(color: AppColors.errorTextColor)),
                        content: Text(state.message),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.backgroundColor.withOpacity(0.6),
                        blurRadius: 12.0,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.login,
                        size: 80,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextField(
                        controller: _emailController,
                        label: 'Email',
                        obscureText: false,
                      ),
                      const SizedBox(height: 16.0),
                      CustomTextField(
                        controller: _passwordController,
                        label: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 24.0),
                      CustomElevatedButton(
                        text: 'Login',
                        onPressed: () {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          context.read<LoginCubit>().signInWithEmail(email, password);
                        },
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.textColor,
                      ),
                      const SizedBox(height: 16.0),
                      CustomGoogleSignInButton(
                        onPressed: () {
                          context.read<LoginCubit>().signInWithGoogle();
                        },
                      ),
                      const SizedBox(height: 24.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.signup);
                        },
                        child: const Text(
                          'Don\'t have an account? Sign up here',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
