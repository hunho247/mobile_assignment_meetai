import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_assignment_meetai/model/moment.dart';
import 'package:mobile_assignment_meetai/repository/repository.dart';

class MomentProvider {
  static Future<Moment> getUser(String username) async {
    http.Response response = await Repository().response();

    if (response.statusCode == 200) {
      return Moment.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load moment from ${username}');
    }
  }
}
