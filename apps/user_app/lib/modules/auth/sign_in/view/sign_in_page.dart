import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';
import 'package:user_app/configs/configs.dart';
import 'package:user_app/modules/auth/sign_in/sign_in.dart';
import 'package:utils/utils.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static final route = GoRoute(
    path: '/${RouteNames.signIn.toKebabCase()}',
    name: RouteNames.signIn,
    builder: (context, state) =>
        BlocProvider(create: (_) => SignInCubit(), child: const SignInPage()),
  );

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}
