import 'package:bitsplit/core/error/failure.dart';
import 'package:bitsplit/core/usecase/usecase.dart';
import 'package:bitsplit/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParams> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  UserSignUp({required FirebaseAuthRepository firebaseAuthRepository})
      : _firebaseAuthRepository = firebaseAuthRepository;

  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await _firebaseAuthRepository.signUpWithEmailAndPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams(
      {required this.name, required this.email, required this.password});
}
