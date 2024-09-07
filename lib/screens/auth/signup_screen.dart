import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edtech_app/screens/auth/login_screen.dart';
import 'package:edtech_app/providers/auth_provider.dart' as AppAuthProvider;
import 'package:edtech_app/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../utils/navigation.dart';
import '../widgets/dashboard_screen_course_card.dart';
import '../dashboard/dashboard_courses_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  try {
                    UserCredential userCredential =
                    await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (userCredential.user != null) {
                      // Signup successful
                      Provider.of<AppAuthProvider.AuthProvider>(context, listen: false)
                          .setUser(userCredential.user!);


                      // Navigate to Dashboard or any other screen after signup
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnrolledCoursesScreen(),
                        ),
                      );
                    }
                  } catch (e) {
                    // Handle signup errors
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Failed to sign up. Error: $e'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Navigation.loginRoute);
              },
              child: Text('Already have an account? Login here'),
            ),
          ],
        ),
      ),
    );
  }
}
