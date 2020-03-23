import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/bloc/login_bloc.dart';
import 'package:insurance/repository/login_repository.dart';
import 'package:insurance/screens/login_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              authentication: LocalAuthentication()
            )
          ),
        ], 
        child: LoginScreen()
      ),
    );
  }
}