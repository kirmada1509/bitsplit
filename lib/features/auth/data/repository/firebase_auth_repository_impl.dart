import 'package:bitsplit/core/error/failure.dart';
import 'package:bitsplit/features/auth/data/datasources/firebase_data_source.dart';
import 'package:bitsplit/features/auth/domain/repository/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository{
  final FirebaseAuthDataSource _firebaseAuthDataSource;

  FirebaseAuthRepositoryImpl(this._firebaseAuthDataSource);

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name, 
    required String email, 
    required String password
  }) async {
    try {
      final String userId = await _firebaseAuthDataSource.signUpWithEmailPassword(
        name: name, 
        email: email, 
        password: password
      );
      return Right(userId);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message!));
    }
  }

  @override
  Future<Either<Failure, String>> logInWithEmailAndPassword({
    required String email, 
    required String password
  }) async {
    try {
      final String userId = await _firebaseAuthDataSource.logInWithEmailPassword(
        email: email, 
        password: password
      );
      return Right(userId);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message! ));
    }
  }
}