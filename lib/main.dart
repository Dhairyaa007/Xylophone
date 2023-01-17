import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  int count = 1;
  var colorList = [
    const Color(0xFFFF0000),
    const Color(0xFFFFA500),
    const Color(0xFFFFEE00),
    const Color(0xFF4DE94C),
    const Color(0xFF3783FF),
    const Color(0xFF00F5FF),
    const Color(0xFFEA047E)
  ];

  void playSound(int sound) {
    final player = AudioPlayer();
    player.play((AssetSource('note$sound.wav')));
  }

  Expanded createButton(int colorno, int songno) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size.infinite),
          backgroundColor: MaterialStatePropertyAll(
            colorList[colorno],
          ),
        ),
        onPressed: () {
          playSound(songno);
        },
        child: const Text(' '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'XYLOPHONE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'SourceSansPro',
              letterSpacing: 2.5,
            ),
          ),
          backgroundColor: const Color(0xFF444444),
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [for (int i = 0; i <= 6; i++) createButton(i, count + i)],
        ),
      ),
    );
  }
}