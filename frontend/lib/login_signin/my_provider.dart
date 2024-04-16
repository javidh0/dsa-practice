import 'package:flutter/material.dart';

class LoginData extends ChangeNotifier {
  List<String> data = ["", ""];
  bool success = false;
  void init(int n) {
    for (int i = 0; i < n; i++) {
      data.add("");
    }
  }

  void setSuccess() {
    success = true;
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
