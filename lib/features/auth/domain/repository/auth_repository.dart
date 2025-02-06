import 'package:bitsplit/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signInWithEmailPassword(String email, String password);
  Future<UserEntity?> signUpWithEmailPassword(String name, String email, String password);
  Future<void> signOut();
  Stream<UserEntity?> get userStream;
}
