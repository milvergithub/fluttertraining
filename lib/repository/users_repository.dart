import 'package:flutter/material.dart';
import 'package:insurance/models/user.dart';
import 'package:insurance/providers/api_service.dart';

class UserRepository {
  final RestClient restClient;

  UserRepository({@required this.restClient}) : assert(restClient != null);

  Future<List<User>> getUsers() async {
    return await restClient.getUsers();
  }
}