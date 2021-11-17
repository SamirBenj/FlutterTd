import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:td1/testSqlite/userclass.dart';

class DatabaseFunctions {
  Future<Database> initializeDB() async {
    var databasepPath = await getDatabasesPath();
    String path = join(databasepPath, 'demoTest.db');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db
          .execute(
              "CREATE TABLE myUsers(id INTEGER PRIMARY KEY AUTOINCREMENT, Nom TEXT NOT NULL,Prenom TEXT NOT NULL, age INTEGER NOT NULL)")
          .whenComplete(() {
        print('hell');
      });
      await db
          .execute(
              "INSERT INTO myUsers('Nom','Prenom', 'age') VALUES ('Test','testi',20)")
          .whenComplete(() {
        print('dit it bro');
      });
    });
  }

  Future<int> insertUser(List<Users> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('myUsers', user.toMap());
    }
    return result;
  }

  Future<List<Users>> retrieveUsers() async {
    print('retrieveing user ...');
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('myUsers');

    return queryResult.map((e) => Users.fromMap(e)).toList();
  }
}
