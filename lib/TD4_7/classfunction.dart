import 'dart:convert';

import 'package:td1/TD4_7/userclass.dart';
import 'package:http/http.dart' as http;

class FunctionApi {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<UserClass>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<UserClass> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<UserClass> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserClass>((json) => UserClass.fromJson(json)).toList();
  }
}
