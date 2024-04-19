import 'package:flutter/material.dart';
import 'package:frontend/utils/fonts.dart';

import '../utils/g_widgets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: const Icon(Icons.abc),
          title: Text(
            "App Name",
            style: textFont,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(child: Icon(Icons.abc)),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}

class EnrolledSheets extends StatelessWidget {
  const EnrolledSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
