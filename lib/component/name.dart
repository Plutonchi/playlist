import 'package:flutter/material.dart';
import 'package:musicplay/component/background.dart';
import 'package:musicplay/component/songs.dart';

class names extends StatefulWidget {
  const names({Key? key}) : super(key: key);

  @override
  State<names> createState() => _namesState();
}

class _namesState extends State<names> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Fon(),
          Songs(),
        ],
      ),
    );
  }
}
