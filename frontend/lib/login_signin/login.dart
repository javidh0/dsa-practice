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
          color: Color.fromRGBO(224, 157, 32, 1),
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
            leading: SizedBox(),
            updateFuntion: context.read<LoginData>().updateData,
          ),
        ),
      ),
    );
  }
}

class MyListForm extends StatelessWidget {
  const MyListForm({
    super.key,
    required this.leading,
    required this.hints,
    required this.primaryClr,
    required this.updateFuntion,
  });

  final List<String> hints;
  final Color primaryClr;
  final Widget leading;
  final Function updateFuntion;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    List<String> responses = [];
    int n = hints.length;
    for (int i = 0; i < n; i++) {
      widgets.add(
        MyBaseInputField(
          text: hints[i],
          onChange: (val) {
            responses.add(val);
            updateFuntion(i, val);
          },
        ),
      );
    }

    widgets.add(
      MyBaseButton(
        onPressed: () {
          print(context.read<LoginData>().data);
        },
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: primaryClr,
      ),
      child: Column(
        children: widgets,
      ),
    );
  }
}

void dummyCallback() {}

class MyBaseButton extends StatefulWidget {
  const MyBaseButton({
    super.key,
    this.onPressed = dummyCallback,
  });

  final Function onPressed;

  @override
  State<MyBaseButton> createState() => _MyBaseButtonState();
}

class _MyBaseButtonState extends State<MyBaseButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading
          ? null
          : () {
              setState(() {
                isLoading = true;
              });
              widget.onPressed();
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        padding: const EdgeInsets.all(16.0),
      ),
      icon: isLoading
          ? Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2.0),
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            )
          : const Icon(Icons.feedback),
      label: const Text('SUBMIT'),
    );
  }
}
