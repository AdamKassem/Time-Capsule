import 'package:flutter/material.dart';
import 'package:time_capsule/Service/auth.dart';
import 'package:time_capsule/widgets.dart';

class ProfileP extends StatefulWidget {
  @override
  _ProfilePState createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarProfile(),
      ),
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Image(
            //height: MediaQuery.of(context).size.height/2.8,
            fit: BoxFit.cover,
            image: AssetImage('assets/images/cover.jpg'),
          ),
          Positioned(
            bottom: -70,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profilepic.jpg'),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  children: <Widget>[
                    SizedBox(height: 12),
                    Text(
                      "NAME",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SourceSansPro',
                        letterSpacing: .2,
                      ),
                    ),
                    Text(
                      "Bio",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SourceSansPro',
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
