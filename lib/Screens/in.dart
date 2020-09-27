import 'package:flutter/material.dart';
import 'package:time_capsule/Service/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign in to Time Capusle'),
      ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: RaisedButton(
            child: Text('Sign in email'),
            onPressed: () async {
              dynamic result = await _auth.signInEmail();
              if(result==null){
                print('error signing in');
              }
              else{
                print('signed in');
                print(result);
              }
            },
          ),
    ),
    );
  }
}
