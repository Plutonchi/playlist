import 'package:musicplay/slider/image.dart';
import 'package:musicplay/slider/sleder.dart';
import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/море.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
           
            images(),
            buttons(),
          ],
        ),
      ),
    );
  }
}
