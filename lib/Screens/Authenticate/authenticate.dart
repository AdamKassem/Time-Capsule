import 'package:flutter/material.dart';
import 'package:time_capsule/Screens/in.dart';
import 'package:time_capsule/Screens/Authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  AuthenticateState createState() => AuthenticateState();
}

class AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
}

  @override
  Widget build(BuildContext context) {
    if (showSignIn == true){
      return SignIn(toggleView: toggleView);
    }
    else{
      return Register(toggleView: toggleView);
    }

  }
}
