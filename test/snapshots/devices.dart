import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as toolkit;

final class _Devices {
  static toolkit.Device get iphone8 => const toolkit.Device(
        size: Size(375.0, 667.0),
        name: 'iphone_8',
        safeArea: EdgeInsets.only(top: 20.0),
      );

  static toolkit.Device iphone8WithTextScale(double textScale) =>
      iphone8.copyWith(
        name: 'iphone_8',
        textScale: textScale,
      );

  static toolkit.Device get iphone11 => const toolkit.Device(
        size: Size(414.0, 896.0),
        name: 'iphone_11',
        safeArea: EdgeInsets.only(top: 48.0, bottom: 34.0),
      );

  static toolkit.Device iphone11WithTextScale(double textScale) =>
      iphone11.copyWith(
        name: 'iphone_11',
        textScale: textScale,
      );

  static toolkit.Device get iphone12ProMax => const toolkit.Device(
        size: Size(428.0, 926.0),
        name: 'iphone_12_pro_max',
        safeArea: EdgeInsets.only(top: 47.0, bottom: 34.0),
      );

  static toolkit.Device iphone12ProMaxWithTextScale(double textScale) =>
      iphone12ProMax.copyWith(
        name: 'iphone_12_pro_max',
        textScale: textScale,
      );
}

final devicesWithNormalTextScaleFactor = [
  _Devices.iphone8,
  _Devices.iphone11,
  _Devices.iphone12ProMax,
];

final devicesWithLargeTextScaleFactor = [
  _Devices.iphone8WithTextScale(1.6),
  _Devices.iphone11WithTextScale(1.6),
  _Devices.iphone12ProMaxWithTextScale(1.6),
];
