import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:insurance/models/user.dart';
import 'package:insurance/repository/users_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository});

  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is FetchUsers) {
      yield UserLoading();
      try {
        final List<User> users = await userRepository.getUsers();
        yield UserLoadedState(users: users);
      } catch(e) {
        yield UserError("Error");
      }
    }
  }
}
