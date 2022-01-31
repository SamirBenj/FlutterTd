import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:td1/TD4_7/dataapi.dart';
import 'package:td1/TD4_7/dataapilocal.dart';

class ApiTestMain extends StatefulWidget {
  ApiTestMain({Key? key}) : super(key: key);

  @override
  _ApiTestMainState createState() => _ApiTestMainState();
}

class _ApiTestMainState extends State<ApiTestMain> {
  late TextEditingController inputField1;

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   inputField1.dispose();
  //   super.dispose();
  // }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//get APi
  _filter(value) {
    if (inputField1.text.contains(value.toString().toLowerCase())) {
      print('found it ');
    }
  }

  @override
  void initState() {
    super.initState();
    inputField1 = TextEditingController();
  }

  final List _pageApli = [
    Page1ApiData(),
    Page2ApiDataLocal(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'Data from api',
          ),
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off),
            label: 'Hello',
          ),
        ],
        currentIndex: 1,
        onTap: _onItemTapped,
      ),
      // appBar: AppBar(
      //   title: const Text('WebServiceTest'),
      // ),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextField(
          controller: inputField1,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // _filter();
              },
            ),
            enabledBorder: OutlineInputBorder(),
          ),
        ),
        // leading: const Icon(
        //   Icons.search,
        //   color: Colors.black,
        //   size: 30,
        // ),
      ),
      body: _pageApli[_selectedIndex],
    );
  }
}
