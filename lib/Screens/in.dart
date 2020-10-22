import 'package:flutter/material.dart';
import 'package:time_capsule/Service/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[400],
      //   elevation: 0.0,
      //   title: Text('Sign in to Time Capusle'),
      //   actions: <Widget>[
      //     FlatButton.icon(
      //       icon: Icon(Icons.person),
      //       label: Text('Register'),
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
              padding: EdgeInsets.fromLTRB(32, 120, 32, 0),
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
                            'Sign In',
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
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                            if(result == null){
                             setState(() => error = 'Could not sign in with those credentials');
                            }
                          }
                        }
                    ),
                      SizedBox(height: 1.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                                radius: 22,
                                backgroundImage: AssetImage('assets/images/google.png'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                                radius: 22,
                                backgroundImage: AssetImage('assets/images/twitter.png'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                                radius: 22,
                                backgroundImage: AssetImage('assets/images/facebook.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
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
                                'Sign Up',
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
