import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:user_app/configs/configs.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alter LMS'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'E-Mail',
            ),
          ),
          const SizedBox(width: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.goNamed(RouteNames.dashboard),
            style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.titleMedium,
            ),
            child: const Text('Sign-In'),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                children: [
                  TextSpan(
                    text: 'Sign-Up here.',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.goNamed(RouteNames.signUp),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                    children: const [],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
