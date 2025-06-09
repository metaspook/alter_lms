import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:uikit/uikit.dart';

/// BuildContext Extensions.
extension BuildContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  Locale get locale => Localizations.localeOf(this);
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  bool get focused => focusScope.hasPrimaryFocus != focusScope.hasFocus;

  /// UnFocus the currentFocus scope.
  void unFocus() {
    if (focused) focusScope.unfocus();
  }

  Widget uninitializedIcon({IconData? data, bool hasToolbarHeight = true}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 2.5,
            child: Icon(data ?? Icons.error_outline_rounded),
          ),
          if (hasToolbarHeight) const SizedBox(height: kToolbarHeight),
        ],
      );

  Widget? backButton<T extends Object?>({T? result, bool unfocus = false}) =>
      Navigator.canPop(this)
      ? IconButton(
          onPressed: () {
            if (unfocus) {
              final currentFocus = FocusScope.of(this);
              if (currentFocus.hasPrimaryFocus != currentFocus.hasFocus) {
                currentFocus.unfocus();
              }
            }
            Navigator.pop<T>(this, result);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        )
      : null;
}

extension MediaQueryDataExt on MediaQueryData {
  // methods related to responsiveness
  bool get isMobile => size.width < 640;
  bool get isDesktop => size.width >= 1024;
  bool get isTablet => size.width >= 640 && size.width < 1024;
}

extension ThemeDataExt on ThemeData {
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;
}

extension WidgetExt on Widget {
  /// Converts to a preferredSizeWidget. If size null, value fallback to
  /// Size.fromHeight(kToolbarHeight).
  PreferredSize toPreferredSize([Size? size]) => PreferredSize(
    preferredSize: size ?? const Size.fromHeight(kToolbarHeight),
    child: ClipRRect(child: this),
  );

  Widget withToolbarHeight() => SizedBox(height: kToolbarHeight, child: this);
}

extension TextStyleExt on TextStyle {
  TextStyle toBold([FontWeight fontWeight = FontWeight.bold]) =>
      copyWith(fontWeight: fontWeight);
}

extension TextEditingControllerExt on TextEditingController {
  /// Prevents widget build error
  set textPostFrame(String newText) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      text = newText;
    });
  }

  /// Selects all text in the controller.
  /// If the controller's text is empty, no action is taken.
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}

/// `requestFocus` Extensions.
extension FocusNodeExt on FocusNode {
  void onSubmitted(String value) {
    if (value.isNotEmpty) requestFocus();
  }
}

extension GapExt on Gap {
  Gap operator *(double other) => Gap(
    mainAxisExtent * other,
    key: key,
    crossAxisExtent: crossAxisExtent,
    color: color,
  );
}

extension FlutterSecureStorageExt on FlutterSecureStorage {
  /// readExistingOrCreate  new
  Future<String?> readOrWrite({
    required String key,
    required String? value,
  }) async {
    final pervious = await read(key: key);
    if (pervious != null) return pervious;
    await write(key: key, value: value);
    return read(key: key);
  }
}
