import 'package:bitsplit/core/errors/failure.dart';
import 'package:bitsplit/features/auth/domain/entities/user_entity.dart';
import 'package:bitsplit/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity?> call(String name, String email, String password) {
    return repository.signUpWithEmailPassword(name, email, password);
  }
}
