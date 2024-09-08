import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:edtech_app/providers/auth_provider.dart' as AppAuthProvider;
import 'package:edtech_app/utils/navigation.dart';
import '../dashboard/dashboard_courses_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return Future.error('Google sign-in cancelled');

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const  Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700), // Golden color
              ),
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color(0xFFFFD700)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xFFFFD700)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFFD700)),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  try {
                    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (userCredential.user != null) {
                      Provider.of<AppAuthProvider.AuthProvider>(context, listen: false)
                          .setUser(userCredential.user!);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EnrolledCoursesScreen()),
                      );
                    }
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error', style: TextStyle(color: Colors.red)),
                          content: Text('Failed to sign up. Error: $e'),
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
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD700), // Golden color
              ),
              child: Text('Sign Up', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  await signInWithGoogle();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EnrolledCoursesScreen()),
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error', style: TextStyle(color: Colors.red)),
                        content: Text('Google sign-in failed'),
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
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              icon: Image.asset(
                'assets/images/google_icon.png', // Add this image in your assets
                height: 24.0,
              ),
              label: Text('Sign up with Google', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Navigation.loginRoute);
              },
              child: Text(
                'Already have an account? Login here',
                style: TextStyle(color: Color(0xFFFFD700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
