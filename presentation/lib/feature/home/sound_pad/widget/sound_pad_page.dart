// ignore_for_file: avoid-missing-enum-constant-in-map

import 'dart:async';

import 'package:domain/analytics/model/analytics_event_type.dart';
import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:domain/analytics/model/analytics_parameter_key_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:presentation/coordinator/flow/app_routes.dart';
import 'package:presentation/design/src/constants/design_system_constants.dart';
import 'package:presentation/feature/home/sound_pad/model/sound_item.dart';
import 'package:presentation/feature/home/sound_pad/model/sound_type.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_container.dart';
import 'package:presentation/utils/extension/analytics_extension.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:rive/rive.dart';

final class SoundPadPage extends StatefulWidget {
  const SoundPadPage({super.key});

  @override
  State<SoundPadPage> createState() => _SoundPadPageState();
}

final class _SoundPadPageState extends State<SoundPadPage> {
  late final RiveAnimationController _controller;
  late final PageController _pageController;
  late final AudioPlayer _player;

  var _activeSound = 0;
  var _amplitude = 0;
  var _tickIndex = 0;
  var _selectedSegmentIndex = 0;

  Timer? _tickTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = OneShotAnimation(
      'Meow',
      autoplay: false,
    );
    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: context.totalWidth,
              height: context.totalHeight / 3,
              child: Stack(
                children: [
                  SizedBox(
                    width: context.totalWidth,
                    height: context.totalHeight / 2.5,
                    child: RiveAnimation.asset(
                      context.assets.animations.meow,
                      stateMachines: ['State Machine 1'],
                      fit: BoxFit.fitWidth,
                      controllers: [_controller],
                      onInit: (_) => setState(() {}),
                      isTouchScrollEnabled: true,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: GestureDetector(
                      onTap: _openSettings,
                      child: Icon(
                        Icons.settings,
                        size: 32,
                        color: Colors.black.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.totalWidth,
              height:
                  context.totalHeight - (context.totalHeight / 3) - context.topSafeArea - context.bottomSafeArea - 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,

                children: [
                  CupertinoSlidingSegmentedControl<int>(
                    onValueChanged: _switchSoundType,
                    groupValue: _selectedSegmentIndex,
                    thumbColor: CupertinoColors.activeGreen,
                    padding: EdgeInsets.all(8),
                    backgroundColor: CupertinoColors.white,
                    children: {
                      0: Text("Meow"),
                      1: Text("Love"),
                      2: Text("Anger"),
                    },
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Padding(
                          padding: allPadding8,
                          child: GridView(
                            scrollDirection: Axis.vertical,
                            reverse: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                            ),
                            children: SoundItem.meowSounds
                                .map(
                                  (item) => SoundPadContainer(
                                    name: item.name,
                                    isActive: item.id == _activeSound,
                                    onTap: () => _playSound(item: item),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        GridView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                          ),
                          children: SoundItem.loveSounds
                              .map(
                                (item) => SoundPadContainer(
                                  name: item.name,
                                  isActive: item.id == _activeSound,
                                  onTap: () => _playSound(item: item),
                                ),
                              )
                              .toList(),
                        ),
                        GridView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                          ),
                          children: SoundItem.angerSounds
                              .map(
                                (item) => SoundPadContainer(
                                  name: item.name,
                                  isActive: item.id == _activeSound,
                                  onTap: () => _playSound(item: item),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: colors.background.background,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _player.dispose();
    _tickTimer?.cancel();
    super.dispose();
  }

  void _openSettings() {
    context.logEvent(
      AnalyticsLogData(
        event: AnalyticsEventType.tappedOnSettings,
      ),
    );
    context.go(SettingsPageRoute().location);
  }

  void _switchSoundType(int? value) {
    final soundTypeId = value ?? 0;
    final soundType = SoundType.fromId(soundTypeId);
    context.logEvent(
      AnalyticsLogData(
        event: AnalyticsEventType.switchSoundType,
        parameters: {
          AnalyticsParameterKeyType.soundType: soundType.name,
        },
      ),
    );

    setState(() {
      _selectedSegmentIndex = soundTypeId;
    });
    _pageController.animateToPage(
      soundTypeId,
      duration: duration200Milliseconds,
      curve: Curves.easeInOut,
    );
  }

  void _playSound({
    required SoundItem item,
  }) async {
    final audioAssets = context.assets.audio;
    context.logEvent(
      AnalyticsLogData(
        event: AnalyticsEventType.playSound,
        parameters: {
          AnalyticsParameterKeyType.soundId: item.id,
        },
      ),
    );

    setState(() {
      _controller.isActive = true;
      _activeSound = item.id;
    });

    await HapticFeedback.lightImpact();

    await _player.setUrl('asset:${item.sound(audioAssets)}');
    await _player.setLoopMode(LoopMode.off);

    final duration = _player.duration;

    await _player.play();

    _cancelActiveSound(
      duration: duration,
      playingNumber: item.id,
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
