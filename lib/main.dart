// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$noteNumber.wav'),
    );
  }

  Expanded buildNote({required Color noteColor, required int note}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(noteColor),
        ),
        onPressed: () {
          playSound(note);
        },
        child: Text(
          'Note $note',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildNote(noteColor: Colors.red, note: 1),
              buildNote(noteColor: Colors.orange, note: 2),
              buildNote(noteColor: Colors.yellow, note: 3),
              buildNote(noteColor: Colors.green, note: 4),
              buildNote(noteColor: Colors.teal, note: 5),
              buildNote(noteColor: Colors.blue, note: 6),
              buildNote(noteColor: Colors.purple, note: 7),
            ],
          ),
        ),
      ),
    );
  }
}
