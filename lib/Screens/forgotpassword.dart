import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Forgot Your Password?',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'SourceSansPro',
            letterSpacing: .5,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.lightBlue[200]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(32, 85, 32, 0),
              child: Column(
                children: <Widget>[
                  FlutterLogo(
                    size: 100,
                  ),
                  TextFormField(
                    autofocus: false,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SourceSansPro',
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter Your Email',
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 17),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.lightBlue, Colors.lightBlue[700]],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 15,
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
