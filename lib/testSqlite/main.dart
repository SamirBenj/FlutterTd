import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'functions.dart';
import 'package:td1/testSqlite/userclass.dart';

class SqlLiteTest extends StatefulWidget {
  const SqlLiteTest({Key? key}) : super(key: key);

  @override
  _SqlLiteTestState createState() => _SqlLiteTestState();
}

class _SqlLiteTestState extends State<SqlLiteTest> {
  late DatabaseFunctions handler;

  @override
  void initState() {
    super.initState();
    this.handler = DatabaseFunctions();
    this.handler.initializeDB().whenComplete(() async {
      await this.addUser().whenComplete(() {
        print('adding user...');
        print(this.addUser().toString());
        databaseExist();
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telethon'),
      ),
      body: FutureBuilder(
        future: this.handler.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot) {
          if (snapshot.hasData) {
            print('snap' + snapshot.data.toString());
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  print(snapshot.data![index].Nom.toString());
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].Nom),
                    ),
                  );
                });
          } else {
            print('snap' + snapshot.data.toString());

            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<int> addUser() async {
    Users user1 = Users(Nom: "sam", Prenom: "ben", age: 20);
    Users user2 = Users(Nom: "sami", Prenom: "benji", age: 30);
    List<Users> listOfUsers = [user1, user2];
    return await this.handler.insertUser(listOfUsers);
  }

  Future<bool> databaseExist() => databaseFactory.databaseExists('demoTest.db');
}
