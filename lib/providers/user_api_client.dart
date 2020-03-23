import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insurance/models/user.dart';
class UserApiClient {
  static const baseUrl = "http://api.github.com";
  final http.Client httpClient;

  UserApiClient({this.httpClient}) : assert(httpClient != null);

  Future<List<User>> fetchUsers() async {
    final List<User> allUsers = [];
    http.Response response = await httpClient.get('$baseUrl/users');
    List<dynamic> responseData = jsonDecode(response.body);
    responseData.forEach((singleUser) {
      allUsers.add(User(login: singleUser['login'], id: singleUser['id']));
    });
    return allUsers;
  }
}