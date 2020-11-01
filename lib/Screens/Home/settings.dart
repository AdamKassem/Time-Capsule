import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_capsule/Service/auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            color: Colors.grey[800],
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.blue,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                SizedBox(width: 5),
                Text(
                  "Account",
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            buildAccountOptionRow(context, "Edit profile"),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Change email"),
            SizedBox(height: 45),
            Row(
              children: <Widget>[
                SizedBox(width: 5),
                Text(
                  "Connections",
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            buildConnectionsOptionRow('assets/images/google.png', "Google", false),
            buildConnectionsOptionRow('assets/images/twitter.png', "Twitter", false),
            buildConnectionsOptionRow('assets/images/facebook.png', "Facebook", false),
            SizedBox(height: 100,),
            GestureDetector(
              onTap: () async{
                Navigator.of(context).pop();
                await _auth.signOut();
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.red[500],
                  ),
                  child: Text(
                    "SIGN OUT",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildConnectionsOptionRow(String image, String title, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 2.5,
                    color: Colors.grey[700],
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  backgroundImage: AssetImage(image),
                ),
              ),
              SizedBox(width: 5,),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.black38,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Transform.scale(
            scale: .8,
            child: CupertinoSwitch(value: isActive, onChanged: (bool val){},))
        ],
      ),
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.black38,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
          );
  }
}
