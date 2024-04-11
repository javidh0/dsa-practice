import 'package:flutter/material.dart';
import './g_functions.dart';

void emptyCallback(val) {}

class MyBaseCard extends StatelessWidget {
  const MyBaseCard({
    super.key,
    required this.color,
    required this.child,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}

class MyBaseInputField extends StatelessWidget {
  const MyBaseInputField({
    super.key,
    required this.text,
    this.primaryClr = Colors.black,
    this.onChange = emptyCallback,
  });

  final String text;
  final Function(String) onChange;
  final Color primaryClr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context, 20),
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: primaryClr,
              width: 2.0,
            ),
          ),
          hintText: text,
        ),
      ),
    );
  }
}
