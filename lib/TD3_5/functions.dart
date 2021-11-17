import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:td1/TD3_5/users.dart';

class DatabaseFunctions {
  Future<Database> initializeDB() async {
    var databasepPath = await getDatabasesPath();
    String path = join(databasepPath, 'demo.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, Nom TEXT NOT NULL,Prenom TEXT NOT NULL, age INTEGER NOT NULL)");
      },
    );
  }

  Future<int> insertUser(List<User> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('users', user.toMap());
    }
    // await db.insert('users', user.toMap());
    return result;
  }

  Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    // return queryResult.map((e) => User.toMap(e).toList());
    // return List.generate(queryResult.length, (i) {
    // return User(
    //   Nom: queryResult[i]['Nom'],
    //   Prenom: queryResult[i]['Prenom'],
    //   age: queryResult[i]['Age'],
    // );
    return queryResult.map((e) => User.fromMap(e)).toList();
    // });
  }
}





// class User {
//   fiint? id;
//   String? Nom;
//   String? Prenom;
//   int? age;
// // this.id, this.Nom, this.Prenom, this.age
//   User(String id, String Nom, String Prenom, int age) {
//     String id = this.id;
//   }
// }
