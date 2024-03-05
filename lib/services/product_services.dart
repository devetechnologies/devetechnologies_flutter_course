import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductServices {
  //Get all Products
  Future<Response> getDataProducts() async {
    const String host = 'paquitastore-app.herokuapp.com';
    const String path = 'products/products-products/';
    Uri reponse = Uri.https(host, path);

    return await http.get(reponse);
  }
}
