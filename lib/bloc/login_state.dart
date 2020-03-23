part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LogginInState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedLoginState extends LoginState {
  final String token;

  LoggedLoginState(this.token);

  @override
  List<Object> get props => [token];
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState(this.message);

  @override
  List<Object> get props => [message];  
}
