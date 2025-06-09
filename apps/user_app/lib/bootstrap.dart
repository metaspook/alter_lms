import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:uikit/uikit.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();
  // Add cross-flavor configuration here
  // Show splash screen while loading
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Only call clearSavedSettings() during testing to reset internal values.
  // if (debugMode) await Upgrader.clearSavedSettings();
  //-- Initialize AppConfig
  final deviceId = await AppConfig.init(
    // updateType: UpdateType.immediate,
    serverMode: ServerMode.remote,
    // refreshedTokenGetter: () => App.refreshTokenGetter(),
  );
  // final authRepo = AuthRepo(webApiService: webApiService, deviceId: deviceId);
  // Remove splash screen and run app
  // FlutterNativeSplash.remove();
  //-- Run entrypoint App widget.


  runApp(await builder());
}
