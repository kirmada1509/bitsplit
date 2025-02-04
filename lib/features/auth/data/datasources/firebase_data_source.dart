import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirebaseAuthDataSource {
  Future<String> signUpWithEmailPassword(
    {
      required String name, 
      required String email, 
      required String password
    }
  );
  Future<String> logInWithEmailPassword(
    {
      required String email, 
      required String password
    }
  );
  Future<void> logout();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> signUpWithEmailPassword({
    required String name, 
    required String email, 
    required String password
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      await userCredential.user!.updateDisplayName(name);
      final User? user = userCredential.user;
      return user!.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<String> logInWithEmailPassword({
    required String email, 
    required String password
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      final User? user = userCredential.user;
      return user!.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}