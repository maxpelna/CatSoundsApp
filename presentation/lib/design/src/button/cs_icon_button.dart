import 'package:flutter/material.dart';

final class CsIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CsIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => IconButton(
    iconSize: 32,
    color: color,
    onPressed: onPressed,
    icon: Icon(icon),
  );
}
