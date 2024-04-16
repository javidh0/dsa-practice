// {
//     "auth" : {
//         "user_id" : "javidh10@gmail.com",
//         "password" : "pass1"
//     }
// }

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiConstants {
  static var baseUrl = "http://localhost:1729/";
  static var endPoints = {
    "sign_in": "sign_in",
  };
}

Future loginAPI(String userId, String password) async {
  //   "http://localhost:1729/sign_in",
  //   headers: {"Content-Type": "application/json"},
  //   body: json.encode(bodyMap),
  // );
  try {
    var response = await http.post(
      Uri.parse('http://localhost:1729/sign_in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "auth": {
          "user_id": "javidh10@gmail.com",
          "password": "pass",
        },
      }),
    );
    return response.body;
  } catch (error) {
    return {"error": "error"};
  }
}
