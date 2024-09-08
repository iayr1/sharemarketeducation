import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edtech_app/providers/auth_provider.dart' as AppAuthProvider;
import 'package:edtech_app/utils/navigation.dart'; 
import 'package:provider/provider.dart';
import '../dashboard/dashboard_courses_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700),
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
                    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
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
                          content: const Text('Invalid email or password'),
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
                backgroundColor: const  Color(0xFFFFD700), // Golden color
              ),
              child: const Text('Login', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 16.0),
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
                        title: const Text('Error', style: TextStyle(color: Colors.red)),
                        content: const Text('Google sign-in failed'),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              icon: Image.asset(
                'assets/images/google_icon.png',
                height: 24.0,
              ),
              label: const Text('Sign in with Google', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Navigation.signupRoute);
              },
              child: const Text(
                'Don\'t have an account? Sign up here',
                style: TextStyle(color: Color(0xFFFFD700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
