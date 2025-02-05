import 'package:bitsplit/features/auth/presentation/providers/auth_state.dart';
import 'package:bitsplit/features/auth/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInScreen extends ConsumerWidget {
  LogInScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = ref.watch(emailControllerProvider);
    TextEditingController passController = ref.watch(passControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomTextField(
              hint: "email",
              controller: emailController,
            ),
            CustomTextField(
              hint: "password",
              passwordField: true,
              controller: passController,
            ),
            ElevatedButton(
              onPressed: () async {},
              child: Text("Log In"),
            ),
          ],
        ),
      ),
    );
  }
}
