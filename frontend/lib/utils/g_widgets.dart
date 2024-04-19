import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './g_functions.dart';
import 'fonts.dart';

void emptyCallback(val) {}

void dummyCallback() {}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.arrow_back),
            title: Text("App Name", style: textFont.copyWith(fontSize: 15)),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 35),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: AutoSizeText(
                    "Mohammed Javidh",
                    minFontSize: 10,
                    style: textFont.copyWith(fontSize: 25),
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          const MyDrawerTile(),
          const MyDrawerTile(),
          const MyDrawerTile(),
        ],
      ),
    );
  }
}

class MyDrawerTile extends StatelessWidget {
  const MyDrawerTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        tileColor: Colors.amber,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
            "Drawer-1",
            style: textFont.copyWith(fontSize: 25),
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Text(
        "The LoGo",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
    required this.load,
    required this.wrong,
    required this.success,
    this.height = 50.0,
    this.sumbitFuntion = dummyCallback,
  });

  final List<String> hints;
  final Color primaryClr;
  final Widget leading;
  final Function updateFuntion, sumbitFuntion;
  final double height;
  final bool load, wrong, success;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    List<String> responses = [];
    int n = hints.length;
    widgets.add(leading);
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

    if (wrong) {
      widgets.add(
        const Text(
          "Invalid credentials",
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    if (!success) {
      widgets.add(
        MyBaseButton(
          load: load,
          onPressed: () {
            sumbitFuntion();
          },
        ),
      );
    }
    return Container(
      height: getHeight(context, height),
      decoration: BoxDecoration(
        color: primaryClr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
    );
  }
}

class MyBaseButton extends StatefulWidget {
  const MyBaseButton({
    super.key,
    required this.load,
    this.onPressed = dummyCallback,
  });

  final Function onPressed;
  final bool load;

  @override
  State<MyBaseButton> createState() => _MyBaseButtonState();
}

class _MyBaseButtonState extends State<MyBaseButton> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.load;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
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
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 20),
      child: SizedBox(
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
      ),
    );
  }
}
