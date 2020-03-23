import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String login;
  final int id;

  User({this.login, this.id});

  @override
  List<Object> get props => [login, id];
}