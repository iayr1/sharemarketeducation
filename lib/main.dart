import 'package:edtech_app/core/utils/navigation_service.dart';
import 'package:edtech_app/feature/onboarding/presentation/bloc/signup_cubit.dart';
import 'package:edtech_app/feature/onboarding/provider/auth_provider.dart';
import 'package:edtech_app/feature/onboarding/presentation/bloc/login_cubit.dart';
import 'package:edtech_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edtech App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Navigation.splashRoute,
      onGenerateRoute: Navigation.generateRoute,
    );
  }
}