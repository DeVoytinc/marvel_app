/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesBackgroundGen get background =>
      const $AssetsImagesBackgroundGen();
  $AssetsImagesHerosGen get heros => const $AssetsImagesHerosGen();

  /// File path: assets/images/marvel.png
  AssetGenImage get marvel => const AssetGenImage('assets/images/marvel.png');

  /// List of all assets
  List<AssetGenImage> get values => [marvel];
}

class $AssetsImagesBackgroundGen {
  const $AssetsImagesBackgroundGen();

  /// File path: assets/images/background/bluebg.png
  AssetGenImage get bluebg =>
      const AssetGenImage('assets/images/background/bluebg.png');

  /// File path: assets/images/background/greenbg.png
  AssetGenImage get greenbg =>
      const AssetGenImage('assets/images/background/greenbg.png');

  /// File path: assets/images/background/purplebg.png
  AssetGenImage get purplebg =>
      const AssetGenImage('assets/images/background/purplebg.png');

  /// File path: assets/images/background/redbg.png
  AssetGenImage get redbg =>
      const AssetGenImage('assets/images/background/redbg.png');

  /// File path: assets/images/background/yellowbg.png
  AssetGenImage get yellowbg =>
      const AssetGenImage('assets/images/background/yellowbg.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bluebg, greenbg, purplebg, redbg, yellowbg];
}

class $AssetsImagesHerosGen {
  const $AssetsImagesHerosGen();

  /// File path: assets/images/heros/capitan.jpg
  AssetGenImage get capitan =>
      const AssetGenImage('assets/images/heros/capitan.jpg');

  /// File path: assets/images/heros/dedpool.jpg
  AssetGenImage get dedpool =>
      const AssetGenImage('assets/images/heros/dedpool.jpg');

  /// File path: assets/images/heros/iron.jpg
  AssetGenImage get iron => const AssetGenImage('assets/images/heros/iron.jpg');

  /// File path: assets/images/heros/spiderman.jpg
  AssetGenImage get spiderman =>
      const AssetGenImage('assets/images/heros/spiderman.jpg');

  /// File path: assets/images/heros/strange.jpg
  AssetGenImage get strange =>
      const AssetGenImage('assets/images/heros/strange.jpg');

  /// File path: assets/images/heros/tanos.jpg
  AssetGenImage get tanos =>
      const AssetGenImage('assets/images/heros/tanos.jpg');

  /// File path: assets/images/heros/thor.jpg
  AssetGenImage get thor => const AssetGenImage('assets/images/heros/thor.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [capitan, dedpool, iron, spiderman, strange, tanos, thor];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
