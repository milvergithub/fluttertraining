import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insurance/bloc/login_bloc.dart';
import 'package:insurance/screens/user_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email;
  TextEditingController password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: MultiBlocListener(
          listeners: [
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is ErrorLoginState) {
                  _showError(context, state.message);
                }
                if (state is LoggedLoginState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
                }
              }
            ),
          ], 
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'EMAIL'),
                      controller: email,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'PASSWORD'),
                      controller: password,
                      obscureText: true,
                    ),
                    RaisedButton(
                      child: Text('LOGIN'), 
                      onPressed: _doLogin,
                    ),
                    Container(
                      child: state is LogginInState? CircularProgressIndicator(): null,
                    )  
                  ],
                )
              ); 
            },
          )
        ),
      ),
    );
  }
   void _doLogin() {
     BlocProvider.of<LoginBloc>(context).add(
       DoLoginEvent(email.text, password.text),
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
