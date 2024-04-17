import 'package:flutter/material.dart';
import 'package:frontend/login_signin/my_provider.dart';
import 'package:provider/provider.dart';
import '../utils/g_widgets.dart';
import 'api.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyBaseCard(
          color: const Color.fromRGBO(224, 157, 32, 1),
          child: MyListForm(
            height: 70,
            wrong: context.watch<RegisterData>().wrong,
            load: context.read<RegisterData>().load,
            success: context.watch<RegisterData>().success,
            hints: const ["Email id", "New password", "Name", "age"],
            primaryClr: Colors.amber,
            leading: const LogoWidget(),
            updateFuntion: context.read<RegisterData>().updateData,
            sumbitFuntion: () async {
              var data = context.read<RegisterData>().getData();
              // print(data);
              context.read<RegisterData>().setLoad(true);
              await registerAPI(data).then(
                (value) {
                  context.read<RegisterData>().setSuccess(value);
                  if (context.read<RegisterData>().success) {
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
