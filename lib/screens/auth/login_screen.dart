import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edtech_app/screens/widgets/dashboard_screen_course_card.dart';
import 'package:edtech_app/providers/auth_provider.dart' as AppAuthProvider; // Updated import
import 'package:edtech_app/utils/navigation.dart';  // Updated import
import 'package:provider/provider.dart';
import 'package:edtech_app/utils/constants.dart';
import '../../utils/navigation.dart';
import '../dashboard/dashboard_courses_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                    await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (userCredential.user != null) {
                      // Login successful
                      Provider.of<AppAuthProvider.AuthProvider>(context, listen: false).setUser(userCredential.user!);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnrolledCoursesScreen(),
                        ),
                      );
                    }
                  } catch (e) {
                    // Handle login errors
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid email or password'),
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
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Navigation.signupRoute);  // Updated usage
              },
              child: Text('Don\'t have an account? Sign up here'),
            ),
          ],
        ),
      ),
    );
  }
}
