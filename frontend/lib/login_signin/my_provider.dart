import 'dart:convert';

import 'package:flutter/material.dart';

class LoginData extends ChangeNotifier {
  List<String> data = ["", ""];
  Map accessKey = {
    "auth": {"user_id": "-1", "access_token": "-1"}
  };
  bool success = false;
  bool wrong = false;
  bool load = false;

  void setLoad(bool val) {
    load = val;
    notifyListeners();
  }

  void setSuccess(token) {
    token = jsonDecode(token);

    try {
      if (token['auth']['access_token'] != "-1") {
        accessKey = token;
        success = true;
        wrong = false;
      } else {
        token;
        wrong = true;
      }
    } catch (e) {
      token;
      wrong = true;
    }
    load = false;
    notifyListeners();
  }

  List<String> getData() {
    return data;
  }

  void updateData(int i, String val) {
    data[i] = val;
    notifyListeners();
  }
}

class RegisterData extends ChangeNotifier {
  List<String> data = ["", "", "", ""];

  void updateData(int i, String val) {
    data[i] = val;
    notifyListeners();
  }

  bool success = false;
  bool wrong = false;
  bool load = false;

  void setLoad(bool val) {
    load = val;
    notifyListeners();
  }

  void setSuccess(val) {
    try {
      var response = jsonDecode(val);

      if (response['error'] != null) {
        wrong = true;
      } else {
        wrong = false;
        success = true;
      }
    } catch (e) {
      wrong = false;
      success = true;
    }
    load = false;
    notifyListeners();
  }

  bool checkRequired() {
    for (int i = 0; i < 4; i++) {
      if (data[i] == "") return false;
    }
    return true;
  }

  Map getData() {
    Map tr = {
      'user_id': data[0],
      'auth': {'email': data[0], 'password': data[1]},
      'name': data[2],
      'age': data[3]
    };

    return tr;
  }
}
