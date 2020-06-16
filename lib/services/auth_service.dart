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
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    //Update username
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;
  }

  //SignIn
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .uid;
  }

  //SignOut
  signOut() {
    return _firebaseAuth.signOut();
  }
}
