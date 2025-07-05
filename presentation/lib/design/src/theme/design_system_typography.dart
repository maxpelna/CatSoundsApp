import 'package:chili_text_scale_factor/chili_text_scale_factor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:presentation/generated/assets/fonts.gen.dart';

final class DesignSystemTypography extends Equatable {
  final TextScaleFactorStyle textScaleFactorStyle;
  final TextStyle largeTitleBold;
  final TextStyle largeTitleRegular;
  final TextStyle title1Bold;
  final TextStyle title1Regular;
  final TextStyle title2Bold;
  final TextStyle title2Regular;
  final TextStyle title3Bold;
  final TextStyle title3Regular;
  final TextStyle headlineBold;
  final TextStyle headlineSemiBold;
  final TextStyle headlineRegular;
  final TextStyle bodySemiBold;
  final TextStyle bodyRegular;
  final TextStyle subheadSemiBold;
  final TextStyle subheadRegular;
  final TextStyle footnoteSemiBold;
  final TextStyle footnoteRegular;
  final TextStyle caption1Medium;
  final TextStyle caption1Regular;
  final TextStyle caption2SemiBold;
  final TextStyle caption2Regular;
  final TextStyle caption3SemiBold;
  final TextStyle caption3Regular;

  const DesignSystemTypography({
    required this.textScaleFactorStyle,
    required this.largeTitleBold,
    required this.largeTitleRegular,
    required this.title1Bold,
    required this.title1Regular,
    required this.title2Bold,
    required this.title2Regular,
    required this.title3Bold,
    required this.title3Regular,
    required this.headlineBold,
    required this.headlineSemiBold,
    required this.headlineRegular,
    required this.bodySemiBold,
    required this.bodyRegular,
    required this.subheadSemiBold,
    required this.subheadRegular,
    required this.footnoteSemiBold,
    required this.footnoteRegular,
    required this.caption1Medium,
    required this.caption1Regular,
    required this.caption2SemiBold,
    required this.caption2Regular,
    required this.caption3SemiBold,
    required this.caption3Regular,
  });

  factory DesignSystemTypography.main({
    required Color defaultTextColor,
    required TextScaleFactorStyle scaleStyle,
  }) =>
      DesignSystemTypography(
        textScaleFactorStyle: scaleStyle,
        largeTitleBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.largeTitle.size(scaleStyle),
          fontWeight: FontWeight.w700,
          height: 41 / 34,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        largeTitleRegular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.largeTitle.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 41 / 34,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        title1Bold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.title1.size(scaleStyle),
          fontWeight: FontWeight.w700,
          height: 34 / 28,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        title1Regular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.title1.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 34 / 28,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        title2Bold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.title2.size(scaleStyle),
          fontWeight: FontWeight.w700,
          height: 28 / 22,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        title2Regular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.title2.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 28 / 22,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        title3Bold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.title3.size(scaleStyle),
          fontWeight: FontWeight.w700,
          height: 25 / 20,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        title3Regular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.title3.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 25 / 20,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        headlineBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.headline.size(scaleStyle),
          fontWeight: FontWeight.w700,
          height: 22 / 17,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        headlineSemiBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.headline.size(scaleStyle),
          fontWeight: FontWeight.w600,
          height: 22 / 17,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        headlineRegular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.headline.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 22 / 17,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        bodySemiBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.body.size(scaleStyle),
          fontWeight: FontWeight.w600,
          height: 22 / 17,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        bodyRegular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.body.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 22 / 17,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        subheadSemiBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.subhead.size(scaleStyle),
          fontWeight: FontWeight.w600,
          height: 20 / 15,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        subheadRegular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.subhead.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 20 / 15,
          fontFeatures: const [FontFeature('calt', 0)],
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        footnoteSemiBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.footnote.size(scaleStyle),
          fontWeight: FontWeight.w600,
          height: 18 / 13,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        footnoteRegular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.footnote.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 18 / 13,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        caption1Medium: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.caption1.size(scaleStyle),
          fontWeight: FontWeight.w500,
          height: 16 / 12,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        caption1Regular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.caption1.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 16 / 12,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        caption2SemiBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.caption2.size(scaleStyle),
          fontWeight: FontWeight.w600,
          height: 13 / 11,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        caption2Regular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.caption2.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 13 / 11,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        caption3SemiBold: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.caption2.size(scaleStyle),
          fontWeight: FontWeight.w600,
          height: 12 / 10,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
        caption3Regular: TextStyle(
          color: defaultTextColor,
          fontSize: TextScaleFactorSize.caption3.size(scaleStyle),
          fontWeight: FontWeight.w400,
          height: 12 / 10,
          decoration: TextDecoration.none,
          decorationColor: Colors.transparent,
          decorationThickness: 0.01,
          fontFamily: FontFamily.openSans,
        ),
      );

  @override
  List<Object?> get props => [
        textScaleFactorStyle,
        largeTitleBold,
        largeTitleRegular,
        title1Bold,
        title1Regular,
        title2Bold,
        title2Regular,
        title3Bold,
        title3Regular,
        headlineBold,
        headlineSemiBold,
        headlineRegular,
        bodySemiBold,
        bodyRegular,
        subheadSemiBold,
        subheadRegular,
        footnoteSemiBold,
        footnoteRegular,
        caption1Medium,
        caption1Regular,
        caption2SemiBold,
        caption2Regular,
        caption3SemiBold,
        caption3Regular,
      ];
}
