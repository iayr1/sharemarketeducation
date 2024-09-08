import 'package:edtech_app/firebase_options.dart';
import 'package:edtech_app/providers/auth_provider.dart';
import 'package:edtech_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edtech App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Navigation.loginRoute,
      onGenerateRoute: Navigation.generateRoute,
    );
  }
}
