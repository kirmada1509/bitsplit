import 'package:bitsplit/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity{
  UserModel({required super.uid, required super.name});

  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName ?? '',
    );
  }
}