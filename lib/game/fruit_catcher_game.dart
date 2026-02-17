import 'dart:async' as dart_async;
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:coba_game/services/audio_manager.dart';
import 'fruit.dart';
import 'basket.dart';
import 'package:flame_audio/flame_audio.dart';


class FruitCatcherGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  final ValueNotifier<int> scoreNotifier = ValueNotifier<int>(0);
  late Basket basket;
  final Random random = Random();

  void incrementScore() {
    scoreNotifier.value++;
    AudioManager().playSfx('collect.mp3');
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // play background music
    AudioManager().initialize();
    AudioManager().playBackgroundMusic();

    basket = Basket();
    add(basket);

    _startSpawningFruit();
  }

  void _startSpawningFruit() {
    dart_async.Timer.periodic(const Duration(seconds: 1), (timer) {
      final xPosition = random.nextDouble() * size.x;

      add(Fruit(position: Vector2(xPosition, -20)));
    });
  }
}
