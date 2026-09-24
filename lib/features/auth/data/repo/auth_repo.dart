import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth;

  AuthRepo(this._firebaseAuth);

 Stream<User?> get authStateChanges {
   return _firebaseAuth.authStateChanges();
 }

 User? get currentUser{
   return _firebaseAuth.currentUser;
 }

 Future<void> logout() async{
   await _firebaseAuth.signOut();
 }




}