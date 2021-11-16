import 'package:flutter/material.dart';
import 'package:td1/TD2_4/page1.dart';
import 'package:td1/TD2_4/page3.dart';

class Ecran2 extends StatelessWidget {
  const Ecran2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ecran n° 2',
              style: TextStyle(
                color: Colors.grey,
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
                primary: Colors.green,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Ecran1()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Ecran n°1'),
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
