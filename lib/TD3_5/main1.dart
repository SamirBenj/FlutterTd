import 'package:flutter/material.dart';
import 'package:td1/TD3_5/functions.dart';
import 'package:td1/TD3_5/users.dart';

class SQLHomepage extends StatefulWidget {
  const SQLHomepage({Key? key}) : super(key: key);

  @override
  State<SQLHomepage> createState() => _SQLHomepageState();
}

class _SQLHomepageState extends State<SQLHomepage> {
  var myUser = User(id: 11, Nom: 'Samir', Prenom: 'Benj', age: 20);
  late DatabaseFunctions handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseFunctions();
    // DatabaseFunctions().initializeDB().whenComplete(()async {
    handler.initializeDB().whenComplete(() async {
      await addUser();
      setState(() {});
      print('dit it');
    });

    // });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLLite'),
      ),
      body: Column(
        children: [
          Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Prenom'),
                      const Text(
                        'SAMIR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // DatabaseFunctions()
                          //     .insertUser(myUser)
                          //     .whenComplete(() {
                          //   print(myUser.toString());
                          //   setState(() {});
                          // });
                          DatabaseFunctions().retrieveUsers().whenComplete(() {
                            print('worked');
                          });
                        },
                        child: const Text('Retrieve User'),
                      )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

Future<int> addUser() async {
  User user1 = User(Nom: "sam", Prenom: "ben", age: 20);
  User user2 = User(Nom: "sami", Prenom: "benji", age: 30);
  List<User> listOfUsers = [user1, user2];
  return await DatabaseFunctions().insertUser(listOfUsers);
}
