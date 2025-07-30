// ignore_for_file: avoid-missing-enum-constant-in-map

import 'dart:async';

import 'package:domain/analytics/model/analytics_event_type.dart';
import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:domain/analytics/model/analytics_parameter_key_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:presentation/a11y/semantic_labels.dart';
import 'package:presentation/coordinator/flow/app_routes.dart';
import 'package:presentation/design/src/button/cs_icon_button.dart';
import 'package:presentation/design/src/constants/design_system_constants.dart';
import 'package:presentation/feature/home/sound_pad/model/rive_config.dart';
import 'package:presentation/feature/home/sound_pad/model/sound_item.dart';
import 'package:presentation/feature/home/sound_pad/model/sound_type.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_grid.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_segmented_control.dart';
import 'package:presentation/utils/extension/analytics_extension.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:rive/rive.dart' hide LinearGradient, Image;

final class SoundPadPage extends StatefulWidget {
  const SoundPadPage({super.key});

  @override
  State<SoundPadPage> createState() => _SoundPadPageState();
}

final class _SoundPadPageState extends State<SoundPadPage> {
  late final RiveAnimationController _riveController;
  late final PageController _pageController;
  late final AudioPlayer _player;

  var _activeSound = 0;
  var _selectedSegmentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _riveController = OneShotAnimation(
      RiveConfig.meowCommand,
      autoplay: false,
    );
    _player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final heightWithoutSafeArea = context.totalHeight - context.topSafeArea - context.bottomSafeArea;
    final catBoxSize = heightWithoutSafeArea * 0.3;
    final soundPadSize = heightWithoutSafeArea * 0.7;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            context.assets.images.background.path,
            semanticLabel: SemanticLabels.image,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.totalWidth,
                  height: catBoxSize,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: context.totalWidth,
                        height: catBoxSize,
                        child: RiveAnimation.asset(
                          context.assets.animations.meow,
                          stateMachines: [RiveConfig.interactionCommand],
                          fit: BoxFit.fitWidth,
                          controllers: [_riveController],
                          onInit: (_) => _onInitRive(),
                          isTouchScrollEnabled: true,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 8,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CsIconButton(
                              icon: Icons.settings,
                              color: colors.text.primaryOnLight,
                              onPressed: _openSettings,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: context.totalWidth,
                  height: soundPadSize,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    verticalDirection: VerticalDirection.up,
                    children: [
                      hBox20,
                      SoundPadSegmentedControl(
                        initialValue: _selectedSegmentIndex,
                        onValueChanged: _switchSoundType,
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SoundPadGrid(
                              items: SoundItem.meowSounds,
                              activeSound: _activeSound,
                              onTap: (item) => _playSound(item: item),
                            ),
                            SoundPadGrid(
                              items: SoundItem.loveSounds,
                              activeSound: _activeSound,
                              onTap: (item) => _playSound(item: item),
                            ),
                            SoundPadGrid(
                              items: SoundItem.angerSounds,
                              activeSound: _activeSound,
                              onTap: (item) => _playSound(item: item),
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
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _riveController.dispose();
    _pageController.dispose();
    _player.dispose();
    super.dispose();
  }

  void _onInitRive() {
    // Following documentation.
    // ignore: avoid-empty-setstate, no-empty-block
    setState(() {});
  }

  void _openSettings() {
    context.logEvent(
      AnalyticsLogData(
        event: AnalyticsEventType.tappedOnSettings,
      ),
    );
    HapticFeedback.lightImpact();
    context.go(SettingsPageRoute().location);
  }

  void _switchSoundType(int? value) {
    final soundTypeId = value ?? 0;
    final soundType = SoundType.fromId(soundTypeId);
    HapticFeedback.lightImpact();
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
      _riveController.isActive = true;
      _activeSound = item.id;
    });

    await HapticFeedback.lightImpact();

    await _player.setUrl(RiveConfig.assetUrl(item.sound(audioAssets)));
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
