import 'package:flutter/material.dart';
import 'package:time_capsule/widgets.dart';

class NotificationsP extends StatefulWidget {
  @override
  _NotificationsPState createState() => _NotificationsPState();
}

class _NotificationsPState extends State<NotificationsP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: MainAppBar(),
      ),
      body: Center(
        child: Text('This is the Notifications Page'),
      ),
    );
  }
}
