import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_capsule/Screens/Authenticate/authenticate.dart';
import 'package:time_capsule/Screens/Home/home.dart';
import 'package:time_capsule/Models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users>(context);

    //Return home or authenticate
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }

  }
}
    