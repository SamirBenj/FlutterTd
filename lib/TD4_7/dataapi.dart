import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:td1/TD4_7/classfunction.dart';
import 'package:td1/TD4_7/userclass.dart';

class Page1ApiData extends StatefulWidget {
  Page1ApiData({Key? key}) : super(key: key);

  @override
  _Page1ApiDataState createState() => _Page1ApiDataState();
}

class _Page1ApiDataState extends State<Page1ApiData> {
  late TextEditingController inputField2 = new TextEditingController();
  List<UserClass> users = [];
  List<UserClass> filteredList = [];

  @override
  void initState() {
    super.initState();

    FunctionApi.getUsers().then((userFromServer) {
      setState(() {
        users = userFromServer;
        filteredList = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextField(
          controller: inputField2,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            enabledBorder: OutlineInputBorder(),
          ),
          onChanged: (string) {
            print('hello' + string);
            filteredList = users
                .where((u) =>
                    (u.name.toLowerCase().contains(string.toLowerCase())))
                .toList();
            setState(() {
              filteredList;
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (BuildContext context, int index) {
          // ignore: unnecessary_null_comparison
          return filteredList == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListTile(
                  title: Text(filteredList[index].name.toString()),
                );
        },
      ),
    );
  }
}
