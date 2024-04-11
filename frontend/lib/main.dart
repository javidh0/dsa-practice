import 'package:flutter/material.dart';
import 'login_signin/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dsa-practice",
      initialRoute: '/login',
      routes: {
        '/': (context) => const WidgetTest(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class WidgetTest extends StatelessWidget {
  const WidgetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Welcome(),
      ),
    );
  }
}
