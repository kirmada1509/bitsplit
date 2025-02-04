import 'package:bitsplit/core/error/failure.dart';
import 'package:bitsplit/core/usecase/usecase.dart';
import 'package:bitsplit/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSingUp implements UseCase<String, UserSingUpParams> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  UserSingUp(this._firebaseAuthRepository);

  @override
  Future<Either<Failure, String>> call(UserSingUpParams params) async {
    return await _firebaseAuthRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password
    );
  }

}

class UserSingUpParams {
  final String name;
  final String email;
  final String password;

  UserSingUpParams({
    required this.name,
    required this.email,
    required this.password
  }); 
}