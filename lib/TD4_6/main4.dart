import 'package:flutter/material.dart';
import 'package:td1/TD3_6/voiture.dart';

class GridViewTest extends StatelessWidget {
  const GridViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Voiture> voit = [
      Voiture("modele", "Twingo",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("renault", "C5",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("modele", "Focus",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("Porshe", "Carrera",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("ferrari", "F340",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("renault", "Twingo",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
      Voiture("renault", "Twingo",
          "https://images.ladepeche.fr/api/v1/images/view/5c53fe478fe56f44823d8b27/large/image.jpg"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid view Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 19,
          ),
          itemCount: voit.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                color: Colors.grey,
              ),
              // margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    voit[index].imglink.toString(),
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Divider(
                      color: Colors.white,
                      height: 2,
                    ),
                  ),
                  Text(
                    voit[index].nom,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    voit[index].modele,
                    style: const TextStyle(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
