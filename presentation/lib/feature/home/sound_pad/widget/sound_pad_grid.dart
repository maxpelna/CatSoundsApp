import 'package:flutter/material.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/feature/home/sound_pad/model/sound_item.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_item.dart';
import 'package:presentation/utils/typedef/typedefs.dart';

final class SoundPadGrid extends StatelessWidget {
  final List<SoundItem> items;
  final int activeSound;
  final SoundItemCallback onTap;

  const SoundPadGrid({
    super.key,
    required this.items,
    required this.activeSound,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: hPadding16,
    child: GridView(
      scrollDirection: Axis.vertical,
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      children: items
          .map(
            (item) => SoundPadItem(
              name: item.name,
              isActive: item.id == activeSound,
              onTap: () => onTap(item),
            ),
          )
          .toList(),
    ),
  );
}
