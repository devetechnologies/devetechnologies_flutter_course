import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/dog.dart';

class DogServices {
  String hostDog = 'api.thedogapi.com';
  String urlDog = '/v1/breeds/';

  //Get all Products
  Future<List<Dog>> getDataDogs() async {
    List<Dog> dogs = [];
    Uri url = Uri.https(hostDog, urlDog, {'limit': '25', 'page': "1"});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List myDogJson = jsonDecode(response.body);
      for (var element in myDogJson) {
        final dog = Dog.fromJson(element);
        dogs.add(dog);
      }
    }

    return dogs;
  }
}
