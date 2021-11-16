import 'package:flutter/material.dart';
import 'package:td1/TD3_6/voiture.dart';

class ListViewTest extends StatelessWidget {
  const ListViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Voiture> voit = [
      Voiture("Nom", "Modele",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("Nom", "Modele",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("Nom", "Modele",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("Nom", "Modele",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste ViEW'),
      ),
      body: ListView.builder(
        itemCount: voit.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.grey.shade300,
            ),
            child: ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          children: [
                            Text(
                              'Photo de la voiture' +
                                  voit[index].modele.toString(),
                            ),
                            Image.network(
                              voit[index].imglink.toString(),
                            )
                          ],
                        )),
                  ),
                );
              },
              title: Text(
                voit[index].nom,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                voit[index].modele,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
