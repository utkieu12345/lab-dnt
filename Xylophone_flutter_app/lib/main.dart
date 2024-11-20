import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import audioplayers

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body : Xylophone(),
      ),
    ),
  );
}

class Xylophone extends StatelessWidget {
  final AudioCache player = AudioCache(); // Khởi tạo AudioCache

  void playSound(int noteNumber) {
    player.play('note$noteNumber.wav'); // Giả sử bạn có các file note1.wav, note2.wav...
  }

  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteNumber);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: SizedBox.shrink(), // Thay null bằng SizedBox.shrink()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, noteNumber: 1),
          buildKey(color: Colors.orange, noteNumber: 2),
          buildKey(color: Colors.yellow, noteNumber: 3),
          buildKey(color: Colors.green, noteNumber: 4),
          buildKey(color: Colors.teal, noteNumber: 5),
          buildKey(color: Colors.blue, noteNumber: 6),
          buildKey(color: Colors.purple, noteNumber: 7),
        ],
      ),
    );
  }
}