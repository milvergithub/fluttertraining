import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/bloc/user_bloc.dart';
import 'package:insurance/providers/api_service.dart';
import 'package:insurance/repository/users_repository.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(userRepository: UserRepository(restClient: RestClient(Dio())))
          )
        ],
        child: UserScreen(),
      ),
    );
  }
}

class UserScreen extends StatefulWidget {

  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    this._doFetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: MultiBlocListener(
          listeners: [
            BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserError) {
                  _showError(context, state.message);
                }
              }
            )
          ],
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is UserLoadedState) {
                return ListView.separated(
                  padding: const EdgeInsets.all(1),
                  itemCount: state.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber,
                      child: Center(child: Text(state.users[index].login)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ); 
              }
              return Text('aaaaa');
            }
          ),
        ), 
      ),
    );
  }

  void _doFetchUsers() {
    BlocProvider.of<UserBloc>(context).add(
      FetchUsers(),
    );
  }
  void _showError(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent.shade700,
      content: Text(message),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}