import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseFunctions {
  Future<Database> initializeDB() async {
    var databasepPath = await getDatabasesPath();
    String path = join(databasepPath, 'demo.db');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, Nom char NOT NULL,Prenom char NOT NULL, age INTEGER NOT NULL");
    });
  }

  // Future<int> insertUser(List<User> user) async {}
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
