import 'package:bitsplit/core/errors/failure.dart';
import 'package:bitsplit/features/auth/domain/entities/user_entity.dart';
import 'package:bitsplit/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.signInWithEmailPassword(email, password);
  }
}
