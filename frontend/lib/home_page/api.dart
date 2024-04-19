import 'dart:convert';
import 'package:http/http.dart' as http;

Future getUser(Map auth) async {
  try {
    var response = await http.post(
      Uri.parse('http://localhost:1729/users/javidh10@gmail.com'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(auth),
    );
    return response.body;
  } catch (error) {
    return {"error": "error"};
  }
}
