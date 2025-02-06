import 'package:bitsplit/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bitsplit/features/auth/domain/entities/user_entity.dart';
import 'package:bitsplit/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);
  
  @override
  Future<UserEntity?> signInWithEmailPassword(String email, String password){
    return remoteDataSource.signInWithEmailPassword(email, password);
  }
  
  @override
  Future<UserEntity?> signUpWithEmailPassword(String name, String email, String password) {
    return remoteDataSource.signUpWithEmailPassword(name, email, password);
  }

  @override
  Future<void> signOut() {
    return remoteDataSource.signOut();
  }
  
  @override
  // TODO: implement userStream
  Stream<UserEntity?> get userStream {
    return remoteDataSource.userStream;
  }

}