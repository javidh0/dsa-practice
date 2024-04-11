import 'package:flutter/material.dart';

class LoginData extends ChangeNotifier {
  List<String> data = ["", "", ""];

  void init(int n) {
    for (int i = 0; i < n; i++) {
      data.add("");
    }
  }

  void updateData(int i, String val) {
    data[i] = val;
    notifyListeners();
  }
}
