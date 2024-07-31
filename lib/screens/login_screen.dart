import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/widgets/common_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static LoginScreen builder(BuildContext ctx, GoRouterState state) =>
      const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CommonInput(title: "Email", hint: "Email"),
          Gap(10),
          CommonInput(title: "Password", hint: "Password"),
          Container(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
          )
        ]),
      ),
    );
  }
}
