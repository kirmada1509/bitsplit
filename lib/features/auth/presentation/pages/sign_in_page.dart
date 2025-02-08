import 'package:bitsplit/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    final signInUseCase = ref.read(signInProvider);
    final user =
        await signInUseCase(emailController.text, passwordController.text);
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
              controller: emailController,
              decoration: InputDecoration(labelText: "Email")),
          TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true),
          ElevatedButton(onPressed: signIn, child: Text("Sign In")),
          TextButton(onPressed: () => context.goNamed("sign-up"), child: Text("Sign Up?")),
        ],
      ),
    );
  }
}
