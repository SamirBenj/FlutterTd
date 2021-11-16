import 'package:flutter/material.dart';
import 'package:td1/TD2_4/page1.dart';
import 'package:td1/TD2_4/page2.dart';

class Ecran3 extends StatelessWidget {
  const Ecran3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ecran n° 3',
              style: TextStyle(
                color: Colors.blue,
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Ecran1()),
                // );
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
          ],
        ),
      ),
    );
  }
}
