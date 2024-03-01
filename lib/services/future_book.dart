import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FutureBook {
  Future<Response> getDataBooks() async {
    const String host = 'www.googleapis.com';
    const String path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(host, path);

    return await http.get(url);
  }
}
