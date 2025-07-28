import 'package:equatable/equatable.dart';
import 'package:presentation/feature/home/sound_pad/model/sound_type.dart';
import 'package:presentation/generated/assets/assets.gen.dart';

final class SoundItem extends Equatable {
  final int id;
  final SoundType type;

  // All meow items.
  // ignore: avoid-global-state
  static List<SoundItem> meowSounds = [
    SoundItem(id: 1, type: SoundType.meow),
    SoundItem(id: 2, type: SoundType.meow),
    SoundItem(id: 3, type: SoundType.meow),
    SoundItem(id: 4, type: SoundType.meow),
    SoundItem(id: 5, type: SoundType.meow),
    SoundItem(id: 6, type: SoundType.meow),
    SoundItem(id: 7, type: SoundType.meow),
    SoundItem(id: 8, type: SoundType.meow),
    SoundItem(id: 9, type: SoundType.meow),
  ];

  // All love items.
  // ignore: avoid-global-state
  static List<SoundItem> loveSounds = [
    SoundItem(id: 11, type: SoundType.love),
    SoundItem(id: 12, type: SoundType.love),
    SoundItem(id: 13, type: SoundType.love),
    SoundItem(id: 14, type: SoundType.love),
    SoundItem(id: 15, type: SoundType.love),
    SoundItem(id: 16, type: SoundType.love),
    SoundItem(id: 17, type: SoundType.love),
    SoundItem(id: 18, type: SoundType.love),
    SoundItem(id: 19, type: SoundType.love),
  ];

  // All anger items.
  // ignore: avoid-global-state
  static List<SoundItem> angerSounds = [
    SoundItem(id: 21, type: SoundType.anger),
    SoundItem(id: 22, type: SoundType.anger),
    SoundItem(id: 23, type: SoundType.anger),
    SoundItem(id: 24, type: SoundType.anger),
    SoundItem(id: 25, type: SoundType.anger),
    SoundItem(id: 26, type: SoundType.anger),
    SoundItem(id: 27, type: SoundType.anger),
    SoundItem(id: 28, type: SoundType.anger),
    SoundItem(id: 29, type: SoundType.anger),
  ];

  const SoundItem({
    required this.id,
    required this.type,
  });

  @override
  List<Object?> get props => [
    id,
    type,
  ];
}

extension SoundItemUI on SoundItem {
  // Switch all ids.
  // ignore: avoid-long-functions
  String sound($ResourcesAssetsAudioGen audio) {
    switch (id) {
      case 1:
        return audio.meow1;
      case 2:
        return audio.meow2;
      case 3:
        return audio.meow3;
      case 4:
        return audio.meow4;
      case 5:
        return audio.meow5;
      case 6:
        return audio.meow6;
      case 7:
        return audio.meow7;
      case 8:
        return audio.meow8;
      case 9:
        return audio.meow9;
      case 11:
        return audio.love1;
      case 12:
        return audio.love2;
      case 13:
        return audio.love3;
      case 14:
        return audio.love4;
      case 15:
        return audio.love5;
      case 16:
        return audio.love6;
      case 17:
        return audio.love7;
      case 18:
        return audio.love8;
      case 19:
        return audio.love9;
      case 21:
        return audio.anger1;
      case 22:
        return audio.anger2;
      case 23:
        return audio.anger3;
      case 24:
        return audio.anger4;
      case 25:
        return audio.anger5;
      case 26:
        return audio.anger6;
      case 27:
        return audio.anger7;
      case 28:
        return audio.anger8;
      case 29:
        return audio.anger9;
      default:
        return audio.meow1;
    }
  }

  // Switch all ids.
  // ignore: avoid-long-functions
  String get name {
    switch (id) {
      case 1:
        return '1';
      case 2:
        return '2';
      case 3:
        return '3';
      case 4:
        return '4';
      case 5:
        return '5';
      case 6:
        return '6';
      case 7:
        return '7';
      case 8:
        return '8';
      case 9:
        return '9';
      case 11:
        return '1';
      case 12:
        return '2';
      case 13:
        return '3';
      case 14:
        return '4';
      case 15:
        return '5';
      case 16:
        return '6';
      case 17:
        return '7';
      case 18:
        return '8';
      case 19:
        return '9';
      case 21:
        return '1';
      case 22:
        return '2';
      case 23:
        return '3';
      case 24:
        return '4';
      case 25:
        return '5';
      case 26:
        return '6';
      case 27:
        return '7';
      case 28:
        return '8';
      case 29:
        return '9';
      default:
        return '';
    }
  }
}
