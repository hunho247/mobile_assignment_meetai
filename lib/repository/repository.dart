import 'package:http/http.dart' as http;

class Repository {
  static final Repository _singleton = Repository._internal();

  Repository._internal();

  factory Repository() {
    return _singleton;
  }

  final String url =
      'https://my-json-server.typicode.com/thailemeetai/mobile-assignment/db';

  Future<http.Response> response() async {
    return await http.get(url);
  }
}
