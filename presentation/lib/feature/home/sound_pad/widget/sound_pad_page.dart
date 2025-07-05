import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:presentation/design/src/constants/design_system_constants.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_container.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:rive/rive.dart';

final class SoundPadPage extends StatefulWidget {
  const SoundPadPage({super.key});

  @override
  State<SoundPadPage> createState() => _SoundPadPageState();
}

final class _SoundPadPageState extends State<SoundPadPage> {
  late final RiveAnimationController _controller;
  late final AudioPlayer _player;

  var _activeSound = 0;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Meow',
      autoplay: false,
    );
    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          SizedBox(
            width: context.totalWidth,
            height: context.totalHeight / 3,
            child: RiveAnimation.asset(
              context.assets.animations.meow,
              stateMachines: ['State Machine 1'],
              fit: BoxFit.fitWidth,
              controllers: [_controller],
              onInit: (_) => setState(() {}),
              isTouchScrollEnabled: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: allPadding8,
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                children: [
                  SoundPadContainer(
                    number: 1,
                    isActive: _activeSound == 1,
                    onTap: () => _playSound(number: 1),
                  ),
                  SoundPadContainer(
                    number: 2,
                    isActive: _activeSound == 2,
                    onTap: () => _playSound(number: 2),
                  ),
                  SoundPadContainer(
                    number: 3,
                    isActive: _activeSound == 3,
                    onTap: () => _playSound(number: 3),
                  ),
                  SoundPadContainer(
                    number: 4,
                    isActive: _activeSound == 4,
                    onTap: () => _playSound(number: 4),
                  ),
                  SoundPadContainer(
                    number: 5,
                    isActive: _activeSound == 5,
                    onTap: () => _playSound(number: 5),
                  ),
                  SoundPadContainer(
                    number: 6,
                    isActive: _activeSound == 6,
                    onTap: () => _playSound(number: 6),
                  ),
                  SoundPadContainer(
                    number: 7,
                    isActive: _activeSound == 7,
                    onTap: () => _playSound(number: 7),
                  ),
                  SoundPadContainer(
                    number: 8,
                    isActive: _activeSound == 8,
                    onTap: () => _playSound(number: 8),
                  ),
                  SoundPadContainer(
                    number: 9,
                    isActive: _activeSound == 9,
                    onTap: () => _playSound(number: 9),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    _player.dispose();
    super.dispose();
  }

  void _playSound({
    required int number,
  }) async {
    final audioAssets = context.assets.audio;

    setState(() {
      _controller.isActive = true;
      _activeSound = number;
    });

    await HapticFeedback.lightImpact();

    var audio = audioAssets.number1;
    switch (number) {
      case 1:
        audio = audioAssets.number1;
      case 2:
        audio = audioAssets.number2;
      case 3:
        audio = audioAssets.number3;
      case 4:
        audio = audioAssets.number4;
      case 5:
        audio = audioAssets.number5;
      case 6:
        audio = audioAssets.number6;
      case 7:
        audio = audioAssets.number7;
      case 8:
        audio = audioAssets.number8;
      case 9:
        audio = audioAssets.number9;
      default:
        audio = audioAssets.number1;
    }

    await _player.setUrl('asset:$audio');
    await _player.setLoopMode(LoopMode.off);
    await _player.play();
    final duration = _player.duration;

    _cancelActiveSound(
      duration: duration,
      playingNumber: number,
    );
  }

  void _cancelActiveSound({
    required Duration? duration,
    required int playingNumber,
  }) async {
    if (duration == null) return;

    await Future.delayed(duration);
    if (_player.playing && playingNumber == _activeSound) {
      if (mounted) {
        setState(() {
          _activeSound = 0;
        });
      }
    }
  }
}
