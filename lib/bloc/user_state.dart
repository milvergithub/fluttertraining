part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {

  final List<User> users;

  UserLoadedState({@required this.users});

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  
  final String message;
  UserError(this.message);
  @override
  List<Object> get props => [message];
}