import 'package:flutter/material.dart';

final class CsCircleRevealClipper extends CustomClipper<Path> {
  final Offset center;
  final double radius;

  const CsCircleRevealClipper({
    required this.center,
    required this.radius,
  });

  @override
  Path getClip(Size size) => Path()..addOval(Rect.fromCircle(center: center, radius: radius));

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
