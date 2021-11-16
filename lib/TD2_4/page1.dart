import 'package:flutter/material.dart';
import 'package:td1/TD2_4/page2.dart';
import 'package:td1/TD2_4/page3.dart';

class Ecran1 extends StatelessWidget {
  const Ecran1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Ecran n°1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ecran n° 1',
              style: TextStyle(
                color: Colors.green,
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Appuyer sur un bouton passer à un autre éran',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  // fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ecran2()),
                );
              },
              child: const Text('Ecran n°2'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ecran3()),
                );
              },
              child: const Text('Ecran n°3'),
            ),
          ],
        ),
      ),
    );
  }
}
