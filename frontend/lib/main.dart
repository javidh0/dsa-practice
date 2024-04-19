import 'package:flutter/material.dart';
import 'package:frontend/home_page/home.dart';
import 'package:frontend/home_page/my_profile.dart';
import 'package:frontend/login_signin/register.dart';
import 'login_signin/login.dart';
import 'package:provider/provider.dart';
import './login_signin/my_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginData()),
        ChangeNotifierProvider(create: (_) => RegisterData())
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
      title: "Dsa-practice",
      initialRoute: '/account',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const MyHomePage(),
        '/account': (context) => const MyAccountPage(),
      },
    );
  }
}
