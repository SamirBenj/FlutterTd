import 'package:flutter/material.dart';
import 'package:td1/TD3_5/functions.dart';

class SQLHomepage extends StatefulWidget {
  const SQLHomepage({Key? key}) : super(key: key);

  @override
  State<SQLHomepage> createState() => _SQLHomepageState();
}

class _SQLHomepageState extends State<SQLHomepage> {
  @override
  void initState() {
    // DatabaseFunctions().initializeDB();
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
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
