import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/data/models/sign.dart';
import 'package:todoapp/providrs/auth/firebase_auth.dart';
import 'package:todoapp/widgets/common_input.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static LoginScreen builder(BuildContext ctx, GoRouterState state) =>
      const LoginScreen();
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final signInParams = SignInParams(email: email, password: password);

    // Utiliser ref.read pour obtenir le provider et gérer les erreurs
    final result = await ref.read(signInProvider(signInParams).future);

    // Après la connexion, vous pouvez rediriger ou gérer l'état de l'utilisateur
    if (result != null) {
      GoRouter.of(context).go('/'); // Redirection vers la page d'accueil
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/login.svg",
              width: 170,
            ),
            CommonInput(
              title: "Email",
              hint: "Email",
              controller: _emailController,
            ),
            const Gap(10),
            CommonInput(
              title: "Password",
              hint: "Password",
              controller: _passwordController,
              obscureText: true,
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signIn,
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
