import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/home_page/api.dart';
import 'package:frontend/login_signin/my_provider.dart';
import 'package:frontend/utils/g_functions.dart';
import 'package:provider/provider.dart';

import '../utils/fonts.dart';
import '../utils/g_widgets.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

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
      body: const MyProfilePage(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(47, 125, 122, 110),
      body: Center(
        child: Text("Loading...", style: textFont),
      ),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  bool isLoading = true;
  var data = {};

  load() async {
    var auth = context.read<LoginData>().accessKey;
    print(auth);
    var res = await getUser(auth);
    return res;
  }

  @override
  void initState() {
    super.initState();
    load().then((val) {
      setState(() {
        data = jsonDecode(val);
        if (data['error'] == null) isLoading = false;
        print(data['name']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreen()
        : SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CircleAvatar(
                      radius: getHeight(context, 10),
                      child: Icon(
                        Icons.person,
                        size: getHeight(context, 8),
                      ),
                    ),
                  ),
                  AutoSizeText(
                    data['name'],
                    minFontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    style: textTitle,
                  ),
                  const SizedBox(height: 25),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  const EditProfileSection(),
                ],
              ),
            ),
          );
  }
}

class EditProfileSection extends StatelessWidget {
  const EditProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      "user_id": "",
      "name": "",
      "age": "",
      "auth": {
        "email": "javidh10@gmail.com",
        "password": "pass1",
      },
    };
    // var key = context.read<LoginData>().accessKey;
    // getUser(key).then((value) {
    //   data = value;
    // });
    return SizedBox(
      width: getWidth(context, 98),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Profile",
            textAlign: TextAlign.left,
            style: textFont.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          InputFieldTile(
              fillText: data["name"],
              text: "Name",
              listner: (listner) {
                data["name"] = listner;
              }),
          InputFieldTile(
              fillText: data["user_id"],
              text: "Email Id",
              listner: (listner) {
                data["user_id"] = listner;
                data["auth"]["email"] = listner;
              }),
          InputFieldTile(
              fillText: data["auth"]["password"],
              text: "Password",
              listner: (listner) {
                data["auth"]["password"] = listner;
              }),
          InputFieldTile(
              fillText: data["age"],
              text: "Age",
              listner: (listner) {
                data["age"] = listner;
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: MyBaseButton(
                load: false,
                onPressed: () async {
                  print(data);
                  var auth = context.read<LoginData>().accessKey;
                  var res = await updateUser(auth, data);
                  print(res);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputFieldTile extends StatelessWidget {
  const InputFieldTile({
    super.key,
    required this.text,
    required this.listner,
    required this.fillText,
  });

  final String text, fillText;
  final Function(String) listner;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: getWidth(context, 80),
        child: Row(
          children: [
            SizedBox(
              width: getWidth(context, 35),
              child: Text(text, style: textFont, textAlign: TextAlign.end),
            ),
            SizedBox(width: getWidth(context, 2)),
            SizedBox(
              width: getWidth(context, 30),
              child: MyBaseInputField(text: fillText, onChange: listner),
            ),
          ],
        ),
      ),
    );
  }
}
