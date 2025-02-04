import 'package:bitsplit/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class FirebaseAuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
    {
      required String name, 
      required String email, 
      required String password
    }
  );
  
  Future<Either<Failure, String>> logInWithEmailAndPassword(
    {
      required String email, 
      required String password
    }
  );
}