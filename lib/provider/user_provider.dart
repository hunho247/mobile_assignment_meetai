import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_assignment_meetai/model/user.dart';
import 'package:mobile_assignment_meetai/repository/repository.dart';

class UserProvider {
  static Future<User> getUser(String username) async {
    http.Response response = await Repository().response();

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user ${username}');
    }
  }
}
