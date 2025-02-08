import 'package:bitsplit/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signInWithEmailPassword(String email, String password);
  Future<UserModel?> signUpWithEmailPassword(
      String name, String email, String password);
  Future<void> signOut();
  Stream<UserModel?> get userStream;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<UserModel?> signInWithEmailPassword(
      String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserModel.fromFireBaseUser(result.user!);
  }

  @override
  Future<UserModel?> signUpWithEmailPassword(
      String name, String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    User user = _firebaseAuth.currentUser!;
    await user.updateDisplayName(name);
    return UserModel.fromFireBaseUser(result.user!);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<UserModel?> get userStream {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
        return null;
      } else {
        return UserModel.fromFireBaseUser(user);
      }
    });
  }
}
