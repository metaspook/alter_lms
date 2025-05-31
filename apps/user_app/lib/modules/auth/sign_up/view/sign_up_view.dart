import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:user_app/configs/configs.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alter LMS')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextFormField(decoration: const InputDecoration(labelText: 'E-Mail')),
          const SizedBox(width: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.titleMedium,
            ),
            child: const Text('Sign-Up'),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                children: [
                  TextSpan(
                    text: 'Sign-In here.',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.goNamed(RouteNames.signIn),
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
