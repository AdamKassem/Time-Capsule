import 'package:flutter/material.dart';
import 'package:time_capsule/Screens/Authenticate/authenticate.dart';
import 'package:time_capsule/Screens/Home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Return home or authenticate
    return Authenticate();
  }
}
    