import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RecaptchaVerifier get verifier => null;

  String get phoneNumber => null;


  //Sign in with email/password
  Future signInEmail() async {
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(email: null, password:null);
    User user = result.user;
    return user;
  }
  catch(e){
    print(e.toString());
        return null;
  }
}

  //Register with email/password



  //Sign out
}