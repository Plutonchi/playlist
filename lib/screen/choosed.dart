import 'package:flutter/material.dart';
import 'package:musicplay/component/name.dart';
import 'package:musicplay/screen/list.dart';

class choose extends StatefulWidget {
  const choose({Key? key}) : super(key: key);

  @override
  State<choose> createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: names(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note_outlined), label: "Albums"),
          BottomNavigationBarItem(icon: Icon(Icons.music_video), label: "Songs"),
        ],
      ),
    );
  }
}
