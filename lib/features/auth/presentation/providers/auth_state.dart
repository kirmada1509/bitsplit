import 'package:bitsplit/features/auth/domain/usecase/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
TextEditingController emailController(Ref ref) {
  return TextEditingController();
}

@riverpod
TextEditingController passController(Ref ref) {
  return TextEditingController();
}

@riverpod
TextEditingController nameController(Ref ref) {
  return TextEditingController();
}

