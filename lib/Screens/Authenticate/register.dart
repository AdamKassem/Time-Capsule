import 'package:flutter/material.dart';
import 'package:time_capsule/Service/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text field state
  String email = '';
  String password = '';
  String error = '';

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
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'SourceSansPro',
            letterSpacing: .5,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[400],
      //   elevation: 0.0,
      //   title: Text('Sign up to Time Capusle'),
      //   actions: <Widget>[
      //     FlatButton.icon(
      //       icon: Icon(Icons.person),
      //       label: Text('Sign in'),
      //       onPressed: () {
      //         widget.toggleView();
      //       },
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(32, 85, 32, 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.lightBlue[200]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FlutterLogo(
                    size: 100,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SourceSansPro',
                      ),
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SourceSansPro',
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val){
                      setState(() => email = val);
                    }
                  ),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SourceSansPro',
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (val) => val.length < 6 ? 'Password must have at least 6 characters' : null,
                    onChanged: (val){
                      setState(() => password = val);
                    }
                  ),
                  TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'SourceSansPro',
                      ),
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
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
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 15,
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                      ),
                    ),
                    onTap: () async{
                      if(_formKey.currentState.validate()){
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() => error = 'Please supply a valid email');
                        }
                      }
                    }
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  SizedBox(height: 80.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Have an account?",
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          color: Colors.grey[700],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]
              )
            )
          ),
        ),
      ),
    );
  }
}
