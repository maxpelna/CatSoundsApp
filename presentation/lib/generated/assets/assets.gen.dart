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

  /// List of all assets
  List<String> get values => [meow];
}

class $ResourcesAssetsAudioGen {
  const $ResourcesAssetsAudioGen();

  /// File path: resources/assets/audio/number_1.wav
  String get number1 => 'resources/assets/audio/number_1.wav';

  /// File path: resources/assets/audio/number_2.mp3
  String get number2 => 'resources/assets/audio/number_2.mp3';

  /// File path: resources/assets/audio/number_3.mp3
  String get number3 => 'resources/assets/audio/number_3.mp3';

  /// File path: resources/assets/audio/number_4.mp3
  String get number4 => 'resources/assets/audio/number_4.mp3';

  /// File path: resources/assets/audio/number_5.mp3
  String get number5 => 'resources/assets/audio/number_5.mp3';

  /// File path: resources/assets/audio/number_6.mp3
  String get number6 => 'resources/assets/audio/number_6.mp3';

  /// File path: resources/assets/audio/number_7.mp3
  String get number7 => 'resources/assets/audio/number_7.mp3';

  /// File path: resources/assets/audio/number_8.mp3
  String get number8 => 'resources/assets/audio/number_8.mp3';

  /// File path: resources/assets/audio/number_9.mp3
  String get number9 => 'resources/assets/audio/number_9.mp3';

  /// List of all assets
  List<String> get values => [
    number1,
    number2,
    number3,
    number4,
    number5,
    number6,
    number7,
    number8,
    number9,
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
