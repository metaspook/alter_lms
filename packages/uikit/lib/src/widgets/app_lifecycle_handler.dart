// ignore_for_file: no_runtimetype_tostring

import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLifecycleHandler extends StatefulWidget {
  const AppLifecycleHandler({required this.child, this.onResume, super.key});
  final Widget child;
  final VoidCallback? onResume;

  @override
  State<AppLifecycleHandler> createState() => _AppLifecycleHandlerState();
}

class _AppLifecycleHandlerState extends State<AppLifecycleHandler> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    // Pass all the callbacks for the transitions you want to listen to
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
      onDetach: _onDetach,
      // onHide: _onHide,
      // onInactive: _onInactive,
      // onPause: _onPause,
      // onRestart: _onRestart,
      onResume: widget.onResume,
      // onShow: _onShow,
      // Handle the onExitRequested callback
      // onExitRequested: _onExitRequested,
    );
  }

  @override
  void dispose() {
    _listener.dispose();

    super.dispose();
  }
  //
  // void _onResume() {
  //
  // }

  void _onDetach() {}

  void _onStateChanged(AppLifecycleState state) {
    // Track state changes
    if (kDebugMode) log(state.name, name: runtimeType.toString());
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // if (state == AppLifecycleState.resumed) {
  //   //   print('\x1B[34m App in foreground\x1B[0m');
  //   // }

  //   // if (state == AppLifecycleState.paused) {
  //   //   print('\x1B[33m App in background\x1B[0m');
  //   // }

  //   print('\x1B[33m App in ${state.name}\x1B[0m');
  // }

  // Ask the user if they want to exit the app. If the user
  // cancels the exit, return AppExitResponse.cancel. Otherwise,
  // return AppExitResponse.exit.
  Future<AppExitResponse> _onExitRequested() async {
    final response = await showDialog<AppExitResponse>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Are you sure you want to quit this app?'),
        content: const Text('All unsaved progress will be lost.'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.cancel);
            },
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.exit);
            },
          ),
        ],
      ),
    );

    return response ?? AppExitResponse.exit;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
