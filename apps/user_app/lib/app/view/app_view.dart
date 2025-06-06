import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/uikit.dart';
import 'package:user_app/app/app.dart';
import 'package:user_app/configs/configs.dart';
import 'package:utils/utils.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter(
      initialLocation: '/${RouteNames.signIn.toKebabCase()}',
      routes: routes,
      // redirect: (context, state) {
      //   final status = context.read<AppBloc>().state.status;

      //   if (status == AppStatus.unauthenticated) {
      //     return '/${RouteNames.signIn.toKebabCase()}';
      //   }

      //   return null;
      // },
    )..attachListener();
  }

  @override
  void dispose() {
    _router.detachListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLifecycleHandler(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData.dark(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _router.config,
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // i. providing AppCubit and Repositories app-wide.
    return RepositoryProvider(
      create: (_) => AppNotificationRepo(),
      child: BlocProvider(create: (_) => AppBloc(), child: const AppView()),
    );
  }
}
