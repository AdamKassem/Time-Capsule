import 'package:flutter/material.dart';
import 'package:time_capsule/Screens/in.dart';

class Authenticate extends StatefulWidget {
  @override
  AuthenticateState createState() => AuthenticateState();
}

class AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SignIn(),
    );
  }
}
