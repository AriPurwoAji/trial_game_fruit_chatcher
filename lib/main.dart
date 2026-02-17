
import 'package:coba_game/game/fruit_catcher_game.dart';
import 'package:coba_game/services/audio_manager.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AudioManager().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trial Fruit Chatcher game',
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late FruitCatcherGame game;
  final ValueNotifier<int> counter = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    game = FruitCatcherGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: game),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ValueListenableBuilder(
                valueListenable: counter,
                builder: (context, score, child) {
                  return Text(
                    "Score: $score",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
          //Icon music & sound
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.music_note, color: Colors.black),
                  onPressed: () {
                    AudioManager().toggleMusic();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.black),
                  onPressed: () {
                    AudioManager().toggleSfx();
                  },
                ),
              ],
            ),
          ),

          // Tombol tambah skor untuk demo
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                // Menambah nilai skor secara dinamis
                counter.value++;
              },
              child: const Text('Tambah Skor'),
            ),
          ),
        ],
      ),
    );
  }
}
