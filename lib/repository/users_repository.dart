import 'package:flutter/material.dart';
import 'package:insurance/models/user.dart';
import 'package:insurance/providers/user_api_client.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({@required this.userApiClient}) : assert(userApiClient != null);

  Future<List<User>> getUsers() async {
    return await userApiClient.fetchUsers();
  }
}