import 'package:bitsplit/features/auth/presentation/providers/obscure.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  String hint;
  bool passwordField;
  TextEditingController controller;
  CustomTextField({super.key, required this.hint, this.passwordField = false, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool iconType = ref.watch(obscureTextProvider);
    return passwordField
        ? TextField(
          controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hint,
              suffixIcon: passwordField
                  ? IconButton(
                      icon: iconType ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                      onPressed: () {
                        ref.read(obscureTextProvider.notifier).toggle();
                      },
                    )
                  : null,
            ),
            obscureText: passwordField,
          )
        : TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hint,
            ),
          );
  }
}
