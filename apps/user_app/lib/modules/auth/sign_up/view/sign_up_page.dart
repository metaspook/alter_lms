import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';
import 'package:user_app/configs/configs.dart';
import 'package:user_app/modules/auth/sign_in/sign_in.dart';
import 'package:user_app/modules/auth/sign_up/sign_up.dart';
import 'package:utils/utils.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static final route = GoRoute(
    path: '/${RouteNames.signUp.toKebabCase()}',
    name: RouteNames.signUp,
    builder: (context, state) =>
        BlocProvider(create: (_) => SignInCubit(), child: const SignInPage()),
  );

  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}
