/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/placeholder
  String get placeholder => 'packages/uikit/assets/fonts/placeholder';

  /// List of all assets
  List<String> get values => [placeholder];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/courses.svg
  String get courses => 'packages/uikit/assets/icons/courses.svg';

  /// File path: assets/icons/groups.svg
  String get groups => 'packages/uikit/assets/icons/groups.svg';

  /// File path: assets/icons/live_class.svg
  String get liveClass => 'packages/uikit/assets/icons/live_class.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'packages/uikit/assets/icons/profile.svg';

  /// File path: assets/icons/settings.svg
  String get settings => 'packages/uikit/assets/icons/settings.svg';

  /// File path: assets/icons/shop.svg
  String get shop => 'packages/uikit/assets/icons/shop.svg';

  /// File path: assets/icons/students.svg
  String get students => 'packages/uikit/assets/icons/students.svg';

  /// List of all assets
  List<String> get values => [
    courses,
    groups,
    liveClass,
    profile,
    settings,
    shop,
    students,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/user_1.jpg
  AssetGenImage get user1 => const AssetGenImage('assets/images/user_1.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [user1];
}

class Assets {
  const Assets._();

  static const String package = 'uikit';

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  static const String package = 'uikit';

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => 'packages/uikit/$_assetName';
}
