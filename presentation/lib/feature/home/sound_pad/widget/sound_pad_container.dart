import 'package:flutter/material.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

final class SoundPadContainer extends StatelessWidget {
  final int number;
  final bool isActive;
  final VoidCallback onTap;

  const SoundPadContainer({
    super.key,
    required this.number,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: isActive ? null : () => onTap(),
    behavior: HitTestBehavior.translucent,
    child: CsTapBuilder(
      builder: (isTapped) => Transform.scale(
        scale: isTapped ? 0.95 : 1,
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? Colors.yellow : Colors.purple,
            border: Border.all(color: Colors.purpleAccent, width: 4),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: context.typography.largeTitleBold.copyWith(
                color: isActive ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
