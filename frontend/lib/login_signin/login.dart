import 'package:flutter/material.dart';
import 'package:frontend/login_signin/my_provider.dart';
import 'package:provider/provider.dart';
import '../utils/g_widgets.dart';
import 'api.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyBaseCard(
          color: const Color.fromRGBO(224, 157, 32, 1),
          child: MyListForm(
            load: context.watch<LoginData>().load,
            wrong: context.watch<LoginData>().wrong,
            success: context.watch<LoginData>().success,
            hints: const ["Email id", "password"],
            primaryClr: Colors.amber,
            leading: const LogoWidget(),
            updateFuntion: context.read<LoginData>().updateData,
            sumbitFuntion: () async {
              var data = context.read<LoginData>().getData();
              context.read<LoginData>().setLoad(true);
              await loginAPI(data[0], data[1]).then(
                (value) {
                  context.read<LoginData>().setSuccess(value);
                  if (context.read<LoginData>().success) {
                    Navigator.pushNamed(context, '/');
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
