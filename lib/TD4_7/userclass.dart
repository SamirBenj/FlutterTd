import 'package:td1/TD3_5/users.dart';

class UserClass {
  String name;
  String username;

  UserClass({required this.name, required this.username});

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      name: json["name"] as String,
      username: json["username"] as String,
    );
  }
}
