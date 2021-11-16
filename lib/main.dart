import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td1/TD2_4/page1.dart';
import 'package:td1/TD3_6/main2.dart';
import 'package:td1/TD4_6/main4.dart';
import 'package:td1/td2.dart';
import 'package:td1/testGrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const TD2(),
      home: const GridViewTest(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salut laurent'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Le bouton appuyé est:'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPage(),
                  ),
                );
              },
              color: Colors.red,
              child: const Text(
                'Raised Button',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                20,
              )),
              onPressed: () {},
              color: Colors.green,
              child: const Text(
                'FlatButton',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.camera,
              color: Colors.blue,
              size: 50,
            ),
            IconButton(
              color: Colors.blue,
              onPressed: () {},
              icon: const Icon(
                Icons.camera,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Outline button'),
              ),
            ),
            CupertinoButton(
              color: Colors.green,
              child: const Text('Cupertino Button'),
              onPressed: () {},
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
