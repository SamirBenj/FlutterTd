import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TD2 extends StatelessWidget {
  const TD2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter AlertDialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Information"),
                    content: const Text("Ceci est un message d'AlertDialog"),
                    actions: [
                      MaterialButton(
                        child: const Text('Fermer'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              },
              child: const Text('Ouvrir une AlertDialog'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text("Information"),
                    content: const Text(
                        "Ceci est un message de CupertinoAlertDialog"),
                    actions: [
                      CupertinoDialogAction(
                          child: const Text(
                            'Fermer',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                );
              },
              child: const Text('Ouvrir une CupertinoAlertDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
