import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:insurance/models/auth.dart';
import 'package:insurance/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LocalAuthentication authentication;

  LoginBloc({@required this.authentication});
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    yield LogginInState();
    try {
      if (event is DoLoginEvent) {
        var token = await authentication.login(event.username, event.password);
        _saveCredentials(Credentials(token: token, fullName: 'Admin', email: event.username));
        yield LoggedLoginState(token);
      }
    } on LoginException {
      yield ErrorLoginState('Error to authenticate please verify your creadentials');
    }
  }

  void _saveCredentials(Credentials credentials) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('credentials', json.encode(credentials));
  }
}