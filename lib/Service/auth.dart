import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_capsule/Models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _userFromFirebaseUser(User user){
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Register in with email/password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }
  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }


  //Sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}