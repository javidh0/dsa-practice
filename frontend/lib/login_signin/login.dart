import 'package:flutter/material.dart';
import 'package:frontend/login_signin/my_provider.dart';
import 'package:provider/provider.dart';
// import 'package:frontend/utils/g_functions.dart';
import '../utils/g_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyBaseCard(
          color: const Color.fromRGBO(224, 157, 32, 1),
          // child: MyBaseInputField(
          //   text: "Hello",
          //   onChange: (val) {
          //     // ignore: avoid_print
          //     print(val);
          //   },
          // ),
          child: MyListForm(
            hints: ["1", "2", "3"],
            primaryClr: Colors.amber,
            leading: MyBaseButton(),
            updateFuntion: context.read<LoginData>().updateData,
          ),
        ),
      ),
    );
  }
}
