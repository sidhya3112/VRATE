import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);
  //SignUp
  Future<String> createUserWithEmailAndPassword(
      String email,
      String password,
      String name,
      String phone,
      String subject,
      String batch,
      String branch) async {

  }

//SignIn

//SignOut

}
