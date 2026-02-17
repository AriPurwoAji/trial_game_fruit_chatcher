import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:coba_game/services/audio_manager.dart';

class FruitCatcherGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);
  void incrementScore() {
    scoreNotifier.value++;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // play background music
    AudioManager().playBackgroundMusic();
  }
}
