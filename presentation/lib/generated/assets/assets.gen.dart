/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $ResourcesGen {
  const $ResourcesGen();

  /// Directory path: resources/assets
  $ResourcesAssetsGen get assets => const $ResourcesAssetsGen();
}

class $ResourcesAssetsGen {
  const $ResourcesAssetsGen();

  /// Directory path: resources/assets/animations
  $ResourcesAssetsAnimationsGen get animations =>
      const $ResourcesAssetsAnimationsGen();

  /// Directory path: resources/assets/audio
  $ResourcesAssetsAudioGen get audio => const $ResourcesAssetsAudioGen();

  /// Directory path: resources/assets/icons
  $ResourcesAssetsIconsGen get icons => const $ResourcesAssetsIconsGen();

  /// Directory path: resources/assets/images
  $ResourcesAssetsImagesGen get images => const $ResourcesAssetsImagesGen();
}

class $ResourcesAssetsAnimationsGen {
  const $ResourcesAssetsAnimationsGen();

  /// File path: resources/assets/animations/meow.riv
  String get meow => 'resources/assets/animations/meow.riv';

  /// File path: resources/assets/animations/splash.json
  String get splash => 'resources/assets/animations/splash.json';

  /// List of all assets
  List<String> get values => [meow, splash];
}

class $ResourcesAssetsAudioGen {
  const $ResourcesAssetsAudioGen();

  /// File path: resources/assets/audio/anger_1.mp3
  String get anger1 => 'resources/assets/audio/anger_1.mp3';

  /// File path: resources/assets/audio/anger_2.mp3
  String get anger2 => 'resources/assets/audio/anger_2.mp3';

  /// File path: resources/assets/audio/anger_3.mp3
  String get anger3 => 'resources/assets/audio/anger_3.mp3';

  /// File path: resources/assets/audio/anger_4.mp3
  String get anger4 => 'resources/assets/audio/anger_4.mp3';

  /// File path: resources/assets/audio/anger_5.mp3
  String get anger5 => 'resources/assets/audio/anger_5.mp3';

  /// File path: resources/assets/audio/anger_6.mp3
  String get anger6 => 'resources/assets/audio/anger_6.mp3';

  /// File path: resources/assets/audio/anger_7.mp3
  String get anger7 => 'resources/assets/audio/anger_7.mp3';

  /// File path: resources/assets/audio/anger_8.mp3
  String get anger8 => 'resources/assets/audio/anger_8.mp3';

  /// File path: resources/assets/audio/anger_9.mp3
  String get anger9 => 'resources/assets/audio/anger_9.mp3';

  /// File path: resources/assets/audio/love_1.mp3
  String get love1 => 'resources/assets/audio/love_1.mp3';

  /// File path: resources/assets/audio/love_2.mp3
  String get love2 => 'resources/assets/audio/love_2.mp3';

  /// File path: resources/assets/audio/love_3.mp3
  String get love3 => 'resources/assets/audio/love_3.mp3';

  /// File path: resources/assets/audio/love_4.mp3
  String get love4 => 'resources/assets/audio/love_4.mp3';

  /// File path: resources/assets/audio/love_5.mp3
  String get love5 => 'resources/assets/audio/love_5.mp3';

  /// File path: resources/assets/audio/love_6.mp3
  String get love6 => 'resources/assets/audio/love_6.mp3';

  /// File path: resources/assets/audio/love_7.mp3
  String get love7 => 'resources/assets/audio/love_7.mp3';

  /// File path: resources/assets/audio/love_8.mp3
  String get love8 => 'resources/assets/audio/love_8.mp3';

  /// File path: resources/assets/audio/love_9.mp3
  String get love9 => 'resources/assets/audio/love_9.mp3';

  /// File path: resources/assets/audio/meow_1.mp3
  String get meow1 => 'resources/assets/audio/meow_1.mp3';

  /// File path: resources/assets/audio/meow_2.mp3
  String get meow2 => 'resources/assets/audio/meow_2.mp3';

  /// File path: resources/assets/audio/meow_3.mp3
  String get meow3 => 'resources/assets/audio/meow_3.mp3';

  /// File path: resources/assets/audio/meow_4.mp3
  String get meow4 => 'resources/assets/audio/meow_4.mp3';

  /// File path: resources/assets/audio/meow_5.mp3
  String get meow5 => 'resources/assets/audio/meow_5.mp3';

  /// File path: resources/assets/audio/meow_6.mp3
  String get meow6 => 'resources/assets/audio/meow_6.mp3';

  /// File path: resources/assets/audio/meow_7.mp3
  String get meow7 => 'resources/assets/audio/meow_7.mp3';

  /// File path: resources/assets/audio/meow_8.mp3
  String get meow8 => 'resources/assets/audio/meow_8.mp3';

  /// File path: resources/assets/audio/meow_9.mp3
  String get meow9 => 'resources/assets/audio/meow_9.mp3';

  /// List of all assets
  List<String> get values => [
    anger1,
    anger2,
    anger3,
    anger4,
    anger5,
    anger6,
    anger7,
    anger8,
    anger9,
    love1,
    love2,
    love3,
    love4,
    love5,
    love6,
    love7,
    love8,
    love9,
    meow1,
    meow2,
    meow3,
    meow4,
    meow5,
    meow6,
    meow7,
    meow8,
    meow9,
  ];
}

class $ResourcesAssetsIconsGen {
  const $ResourcesAssetsIconsGen();

  /// File path: resources/assets/icons/ic_placeholder.svg
  String get icPlaceholder => 'resources/assets/icons/ic_placeholder.svg';

  /// List of all assets
  List<String> get values => [icPlaceholder];
}

class $ResourcesAssetsImagesGen {
  const $ResourcesAssetsImagesGen();

  /// File path: resources/assets/images/image_placeholder.png
  AssetGenImage get imagePlaceholder =>
      const AssetGenImage('resources/assets/images/image_placeholder.png');

  /// List of all assets
  List<AssetGenImage> get values => [imagePlaceholder];
}

class Assets {
  const Assets._();

  static const $ResourcesGen resources = $ResourcesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

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
    String? package,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
