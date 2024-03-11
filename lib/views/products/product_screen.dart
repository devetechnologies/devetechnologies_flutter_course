import 'package:devetechnologies_flutter_course/services/dog_services.dart';
import 'package:flutter/material.dart';

import '../../models/dog.dart';

class ProductScreen extends StatelessWidget {
  static String routName = '/product-screen';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DogServices productServices = DogServices();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dogs'),
      ),
      body: Center(
        child: FutureBuilder(
          future: productServices.getDataDogs(),
          builder: (context, AsyncSnapshot<List<Dog>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _getDogs(snapshot, index, context);
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _getDogs(
      AsyncSnapshot<List<Dog>> dog, int index, BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(dog.data![index].name!),
            subtitle: Text(dog.data![index].bredFor ?? ""),
            trailing: const Icon(Icons.favorite_outline),
          ),
          SizedBox(
            height: 200,
            child: Ink.image(
              image: NetworkImage(
                  'https://cdn2.thedogapi.com/images/${dog.data![index].referenceImageId}.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(dog.data![index].temperament!),
          ),
          ButtonBar(
            children: [
              TextButton(onPressed: () {}, child: const Text('Learn More'))
            ],
          )
        ],
      ),
    );
  }
}
