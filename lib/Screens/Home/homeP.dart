import 'package:flutter/material.dart';
import 'package:time_capsule/widgets.dart';

class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MainAppBar(),
        ),
        body: Center(
          child: Text("This is the Home Page"),
        ),
      ),
    );
  }
}

