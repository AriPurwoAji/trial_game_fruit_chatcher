import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
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

  final ValueNotifier<int> counter = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ValueListenableBuilder(
              valueListenable: counter, // Pastikan variabel 'counter' sudah ada di class ini
              builder: (context, score, child) {
                return Text(
                  'Score: $score', // Mengambil nilai 'score' terbaru
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            ),
          ),
          
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.music_note, color: Colors.black,),
                  onPressed: () {
                    // Pause game logic here
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.black,),
                  onPressed: () {
                    // Pause game logic here
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
