import 'package:bitsplit/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bitsplit/features/auth/data/repository/auth_repository_impl.dart';
import 'package:bitsplit/features/auth/domain/repository/auth_repository.dart';
import 'package:bitsplit/features/auth/domain/use_cases/signIn_usecase.dart';
import 'package:bitsplit/features/auth/domain/use_cases/signUp_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(firebaseAuthProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

final userStreamProvider = StreamProvider<UserEntity?>((ref) {
  return ref.read(authRepositoryProvider).userStream;
});

final signInProvider = Provider((ref) {
  return SignInUseCase(ref.read(authRepositoryProvider));
});

final signUpProvider = Provider((ref) {
  return SignUpUseCase(ref.read(authRepositoryProvider));
});
