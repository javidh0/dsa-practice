import 'dart:convert';
import 'package:http/http.dart' as http;

Future updateUser(Map auth, Map data) async {
  try {
    var response = await http.post(
      Uri.parse('http://localhost:1729/users/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth': jsonEncode(auth),
      },
      body: jsonEncode(data),
    );
    return response.body;
  } catch (error) {
    return {"error": "error"};
  }
}

Future getUser(Map auth) async {
  String user = auth['auth']['user_id'];
  try {
    var response = await http.get(
      Uri.parse('http://localhost:1729/users/$user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth': jsonEncode(auth),
      },
    );
    return response.body;
  } catch (error) {
    return {"error": "error"};
  }
}
