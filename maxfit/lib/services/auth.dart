import 'package:firebase_auth/firebase_auth.dart';
import 'package:maxfit/domain/client.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Client? _userFromFirebase(user) {
    if (user == null) {
      return null;
    }
    return Client(user.uid, user.email);
  }

  Future<Client?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future<Client?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<Client?>? get user {
    return _fAuth.authStateChanges().map(_userFromFirebase);
  }
}