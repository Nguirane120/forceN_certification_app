import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routes/location_route.dart';
import 'package:todoapp/data/models/sign.dart';
import 'package:todoapp/providrs/auth/firebase_auth.dart';
import 'package:todoapp/widgets/common_input.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});
  static RegisterScreen builder(BuildContext ctx, GoRouterState state) =>
      const RegisterScreen();
  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final signInParams = SignInParams(email: email, password: password);

    final result = await ref.read(signUpProvider(signInParams).future);
    if (result != null) {
      GoRouter.of(context).go(RouteLocation.login);
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
            // SvgPicture.asset(
            //   "assets/images/login.svg",
            //   width: 170,
            // ),
            Text("INSCRPTION"),
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
                onPressed: _signUp,
                child: const Text('Register'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("vous avez deja un compte ? "),
                TextButton(
                  child: Text("Connectez-vous"),
                  onPressed: () {
                    GoRouter.of(context).go(RouteLocation.login);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
