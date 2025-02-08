import 'package:bitsplit/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    final signUpUseCase = ref.read(signUpProvider);
    final user = await signUpUseCase(
        nameController.text, emailController.text, passwordController.text);
    if (user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Welcome ${user.name}!")));
      context.goNamed('home-page');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name")),
          TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email")),
          TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true),
          ElevatedButton(onPressed: signIn, child: Text("Sign Up")),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text("Log In"),
          )
        ],
      ),
    );
  }
}
